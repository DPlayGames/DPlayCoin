# DPlay Coin
DPlay Coin은 DPlay 플랫폼에서 사용되는 화폐입니다.

DPlay Coin은 ERC20 표준 토큰이나, DPlay 스토어 및 DPlay 교역소에서는 `approve`가 불필요합니다.

## 계약 주소
- Mainnet: 0x92c5387aCE61F5c505BF2c2D4c84120F0A813d4B
- Kovan: 0xb53A87bC4E5443a3e7BdaB0FAb53fd5661573036
- Ropsten: 0x1ab85da3f07D66C4465929b8B8C1C8C47b531d5a
- Rinkeby: 0xBDC07353d7D0CBeD081cA08933a1ACA0d9c82a38

## 테스트 여부
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `event Transfer(address indexed _from, address indexed _to, uint _value)`
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `event Approval(address indexed _owner, address indexed _spender, uint _value)`
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `function name() external view returns (string memory)`
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `function symbol() external view returns (string memory)`
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `function decimals() external view returns (uint8)`
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `function totalSupply() external view returns (uint)`
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `function balanceOf(address _owner) external view returns (uint balance)`
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `function transfer(address _to, uint _value) external returns (bool success)`
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `function transferFrom(address _from, address _to, uint _value) external returns (bool success)`
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `function approve(address _spender, uint _value) external returns (bool success)`
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `function allowance(address _owner, address _spender) external view returns (uint remaining)`
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `function getPower(address user) external view returns (uint power)`

## 라이센스
[MIT](LICENSE)