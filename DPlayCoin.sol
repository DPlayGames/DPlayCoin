pragma solidity ^0.5.9;

import "./DPlayCoinInterface.sol";
import "./Standard/ERC20.sol";
import "./Standard/ERC165.sol";
import "./Util/NetworkChecker.sol";
import "./Util/SafeMath.sol";

contract DPlayCoin is DPlayCoinInterface, ERC20, ERC165, NetworkChecker {
	using SafeMath for uint;
	
	// Token information
	// 토큰 정보 
	string constant public NAME = "DPlay Coin";
	string constant public SYMBOL = "DC";
	uint8 constant public DECIMALS = 18;
	uint constant public TOTAL_SUPPLY = 10000000000 * (10 ** uint(DECIMALS));
	
	address public author;
	
	mapping(address => uint) public balances;
	mapping(address => mapping(address => uint)) public allowed;
	
	// 아래 두 주소는 신뢰하는 스마트 계약의 주소로 approve할 필요가 없습니다.
	
	// DPlay 교역소 주소
	address public dplayTradingPost;
	
	// DPlay 스토어 주소
	address public dplayStore;
	
	constructor() public {
		
		author = msg.sender;
		
		balances[author] = TOTAL_SUPPLY;
		
		emit Transfer(address(0x0), author, TOTAL_SUPPLY);
	}
	
	// DPlay 교역소 주소를 지정합니다. (단 한번만 가능합니다.)
	function setDPlayTradingPostOnce(address addr) external {
		
		// 비어있는 주소인 경우에만
		require(dplayTradingPost == address(0));
		
		dplayTradingPost = addr;
	}
	
	// DPlay 스토어 주소를 지정합니다. (단 한번만 가능합니다.)
	function setDPlayStoreOnce(address addr) external {
		
		// 비어있는 주소인 경우에만
		require(dplayStore == address(0));
		
		dplayStore = addr;
	}
	
	// Checks if the address is misued.
	// 주소를 잘못 사용하는 것인지 체크 
	function checkAddressMisused(address target) internal view returns (bool) {
		return
			target == address(0) ||
			target == address(this);
	}
	
	//ERC20: Returns the name of the token.
	//ERC20: 토큰의 이름 반환
	function name() external view returns (string memory) {
		return NAME;
	}
	
	//ERC20: Returns the symbol of the token.
	//ERC20: 토큰의 심볼 반환
	function symbol() external view returns (string memory) {
		return SYMBOL;
	}
	
	//ERC20: Returns the decimals of the token.
	//ERC20: 토큰의 소수점 반환
	function decimals() external view returns (uint8) {
		return DECIMALS;
	}
	
	//ERC20: Returns the total number of tokens.
	//ERC20: 전체 토큰 수 반환
	function totalSupply() external view returns (uint) {
		return TOTAL_SUPPLY;
	}
	
	//ERC20: Returns the number of tokens of a specific user.
	//ERC20: 특정 유저의 토큰 수를 반환합니다.
	function balanceOf(address user) external view returns (uint balance) {
		return balances[user];
	}
	
	//ERC20: Transmits tokens to a specific user.
	//ERC20: 특정 유저에게 토큰을 전송합니다.
	function transfer(address to, uint amount) external payable returns (bool success) {
		
		// Blocks misuse of an address.
		// 주소 오용 차단
		require(checkAddressMisused(to) != true);
		
		require(amount <= balances[msg.sender]);
		
		balances[msg.sender] = balances[msg.sender].sub(amount);
		balances[to] = balances[to].add(amount);
		
		emit Transfer(msg.sender, to, amount);
		
		return true;
	}
	
	//ERC20: Grants rights to send the amount of tokens to the spender.
	//ERC20: spender에 amount만큼의 토큰을 보낼 권리를 부여합니다.
	function approve(address spender, uint amount) external payable returns (bool success) {
		
		allowed[msg.sender][spender] = amount;
		
		emit Approval(msg.sender, spender, amount);
		
		return true;
	}
	
	//ERC20: Returns the quantity of tokens to the spender
	//ERC20: spender가 인출하도록 허락 받은 토큰의 양을 반환합니다.
	function allowance(address user, address spender) external view returns (uint remaining) {
		return allowed[user][spender];
	}
	
	//ERC20: The allowed spender sends the "amount" of tokens from the "from" to the "to".
	//ERC20: 허락된 spender가 from으로부터 amount만큼의 토큰을 to에게 전송합니다.
	function transferFrom(address from, address to, uint amount) external payable returns (bool success) {
		
		// Blocks misuse of an address.
		// 주소 오용 차단
		require(checkAddressMisused(to) != true);
		
		require(amount <= balances[from]);
		
		require(
			// DPlay 교역소와 스토어는 허락이 불필요합니다.
			msg.sender == dplayTradingPost ||
			msg.sender == dplayStore ||
			
			amount <= allowed[from][msg.sender]
		);
		
		balances[from] = balances[from].sub(amount);
		balances[to] = balances[to].add(amount);
		
		allowed[from][msg.sender] = allowed[from][msg.sender].sub(amount);
		
		emit Transfer(from, to, amount);
		
		return true;
	}
	
	//ERC165: Checks if the given interface has been implemented.
	//ERC165: 주어진 인터페이스가 구현되어 있는지 확인합니다.
	function supportsInterface(bytes4 interfaceID) external view returns (bool) {
		return
			// ERC165
			interfaceID == this.supportsInterface.selector ||
			// ERC20
			interfaceID == 0x942e8b22 ||
			interfaceID == 0x36372b07;
	}
	
	// Returns the DC power.
	// DC 파워를 반환합니다.
	function getPower(address user) external view returns (uint power) {
		return balances[user];
	}
	
	// Creates DCs for testing.
	// 테스트용 DC를 생성합니다.
	function createDCForTest(uint amount) external {
		if (network == Network.Mainnet) {
			revert();
		} else {
			balances[msg.sender] += amount;
		}
	}
}
