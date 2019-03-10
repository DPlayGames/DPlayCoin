pragma solidity ^0.5.1;

import "./Standard/ERC20.sol";
import "./Standard/ERC165.sol";
import "./Util/SafeMath.sol";

contract DPlayCoin is ERC20, ERC165 {
	using SafeMath for uint256;
	
	// 토큰 정보
	string constant public NAME = "DPlay Coin";
	string constant public SYMBOL = "DC";
	uint8 constant public DECIMALS = 18;
	uint256 constant public TOTAL_SUPPLY = 10000000000 * (10 ** uint256(DECIMALS));
	
	address public author;
	
	mapping(address => uint256) public balances;
	mapping(address => mapping(address => uint256)) public allowed;
	
	constructor() public {
		
		author = msg.sender;
		
		balances[author] = TOTAL_SUPPLY;
		
		emit Transfer(address(0x0), author, TOTAL_SUPPLY);
	}
	
	// 주소를 잘못 사용하는 것인지 체크
	function checkAddressMisused(address target) internal view returns (bool) {
		return
			target == address(0) ||
			target == address(this);
	}
	
	//ERC20: 토큰의 이름 반환
	function name() external view returns (string memory) {
		return NAME;
	}
	
	//ERC20: 토큰의 심볼 반환
	function symbol() external view returns (string memory) {
		return SYMBOL;
	}
	
	//ERC20: 토큰의 소수점 반환
	function decimals() external view returns (uint8) {
		return DECIMALS;
	}
	
	//ERC20: 전체 토큰 수 반환
	function totalSupply() external view returns (uint256) {
		return TOTAL_SUPPLY;
	}
	
	//ERC20: 특정 유저의 토큰 수를 반환합니다.
	function balanceOf(address user) external view returns (uint256 balance) {
		return balances[user];
	}
	
	//ERC20: 특정 유저에게 토큰을 전송합니다.
	function transfer(address to, uint256 amount) external payable returns (bool success) {
		
		// 주소 오용 차단
		require(checkAddressMisused(to) != true);
		
		require(amount <= balances[msg.sender]);
		
		balances[msg.sender] = balances[msg.sender].sub(amount);
		balances[to] = balances[to].add(amount);
		
		emit Transfer(msg.sender, to, amount);
		
		return true;
	}
	
	//ERC20: spender에 amount만큼의 토큰을 보낼 권리를 부여합니다.
	function approve(address spender, uint256 amount) external payable returns (bool success) {
		
		allowed[msg.sender][spender] = amount;
		
		emit Approval(msg.sender, spender, amount);
		
		return true;
	}
	
	//ERC20: spender에 인출을 허락한 토큰의 양을 반환합니다.
	function allowance(address user, address spender) external view returns (uint256 remaining) {
		return allowed[user][spender];
	}
	
	//ERC20: 허락된 spender가 from으로부터 amount만큼의 토큰을 to에게 전송합니다.
	function transferFrom(address from, address to, uint256 amount) external payable returns (bool success) {
		
		// 주소 오용 차단
		require(checkAddressMisused(to) != true);
		
		require(amount <= balances[from]);
		require(amount <= allowed[from][msg.sender]);
		
		balances[from] = balances[from].sub(amount);
		balances[to] = balances[to].add(amount);
		
		allowed[from][msg.sender] = allowed[from][msg.sender].sub(amount);
		
		emit Transfer(from, to, amount);
		
		return true;
	}
	
	//ERC165: 주어진 인터페이스가 구현되어 있는지 확인합니다.
	function supportsInterface(bytes4 interfaceID) external view returns (bool) {
		return
			// ERC165
			interfaceID == this.supportsInterface.selector ||
			// ERC20
			interfaceID == 0x942e8b22 ||
			interfaceID == 0x36372b07;
	}
	
	// DC 파워를 반환합니다.
	function getPower(address user) external view returns (uint256 power) {
		return balances[user];
	}
}