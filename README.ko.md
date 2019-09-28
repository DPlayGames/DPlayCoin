# DPlay Coin
DPlay Coin은 DPlay 플랫폼에서 사용되는 화폐입니다.
DPlay Coin is a currency used in DPlay platform.

DCPower

DPlay Coin은 ERC20 표준 토큰이나, DPlay 스토어 및 DPlay 교역소에서는 `approve`가 불필요합니다.

## 계약 주소
- Kovan: 0xD49bc1247d25FBDF2bB25F5A3333b15198FbA544

## 테스트 여부
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-no-red.svg) `event Transfer(address indexed _from, address indexed _to, uint _value)`
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-no-red.svg) `event Approval(address indexed _owner, address indexed _spender, uint _value)`
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `function name() external view returns (string memory)`
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `function symbol() external view returns (string memory)`
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `function decimals() external view returns (uint8)`
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-no-red.svg) `function totalSupply() external view returns (uint)`
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-no-red.svg) `function balanceOf(address _owner) external view returns (uint balance)`
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-no-red.svg) `function transfer(address _to, uint _value) external returns (bool success)`
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-no-red.svg) `function transferFrom(address _from, address _to, uint _value) external returns (bool success)`
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-no-red.svg) `function approve(address _spender, uint _value) external returns (bool success)`
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-no-red.svg) `function allowance(address _owner, address _spender) external view returns (uint remaining)`
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-no-red.svg) `function getPower(address user) external view returns (uint power)`