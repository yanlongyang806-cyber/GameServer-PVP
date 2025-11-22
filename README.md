# GameServer - 鍏ㄥ湴鍥剧孩鍚峆K鐗堟湰

杩欐槸娓告垙鏈嶅姟鍣ㄧ殑绮剧畝鐗堟湰锛屽寘鍚叏鍦板浘绾㈠悕PK鍔熻兘銆?

## 鍔熻兘鐗规€?

鉁?**鍏ㄥ湴鍥剧孩鍚峆K妯″紡**
- 鎵€鏈夌帺瀹惰繘鍏ユ父鎴忓悗浜掔浉鏄剧ず涓虹孩鍚嶏紙鏁屽鐘舵€侊級
- 鍙互鍦ㄥ叏鍦板浘浠讳綍浣嶇疆浣跨敤鏅€氭敾鍑诲拰鎶€鑳芥敾鍑诲叾浠栫帺瀹?
- 绉婚櫎浜嗘墍鏈塒K鍖哄煙闄愬埗
- 绉婚櫎浜嗗ぇ閮ㄥ垎PK闄愬埗鏉′欢

## 缂栬瘧瑕佹眰

- **Visual Studio 2022** (鎺ㄨ崘) 鎴?Visual Studio 2019/2017
- **Windows SDK 10.0**
- **C++ 妗岄潰寮€鍙戝伐浣滆礋杞?*

## 缂栬瘧姝ラ

### 鏂规硶涓€锛氫娇鐢?Visual Studio

1. 鎵撳紑 CoreGameServer.sln
2. 閫夋嫨閰嶇疆锛歚Debug | Win32
3. 鑿滃崟锛?*鐢熸垚(B)** 鈫?**鐢熸垚瑙ｅ喅鏂规**
4. 鎴栨寜 Ctrl+Shift+B

### 鏂规硶浜岋細浣跨敤鍛戒护琛?

`cmd
cd I:\wdym\GameServer-PVP
msbuild CoreGameServer.sln /p:Configuration=Debug /p:Platform=Win32 /p:PlatformToolset=v143 /m
`

## 杈撳嚭鏂囦欢

缂栬瘧鎴愬姛鍚庯紝GameServer.exe 浼氬湪锛?
`
Core\bin\Debug\GameServer.exe
`

## PVP 淇敼璇存槑

淇敼鐨勬枃浠讹細
- CrossRoads\Common\Combat\Character_target.c - 瀹炰綋鍏崇郴鍒ゆ柇
- CrossRoads\Common\pvp_common.c - PVP鐩稿叧鍑芥暟

璇︾粏淇敼璇存槑璇锋煡鐪嬶細鍏ㄥ湴鍥剧孩鍚峆K淇敼璇存槑.md

## 椤圭洰缁撴瀯

`
GameServer-PVP/
鈹溾攢鈹€ Core/                    # 娓告垙鏈嶅姟鍣ㄦ牳蹇冧唬鐮?
鈹?  鈹溾攢鈹€ GameServer/         # 涓绘湇鍔″櫒椤圭洰
鈹?  鈹斺攢鈹€ Common/             # 閫氱敤浠ｇ爜
鈹溾攢鈹€ CrossRoads/             # 娓告垙閫昏緫
鈹?  鈹溾攢鈹€ GameServerLib/      # 鏈嶅姟鍣ㄥ簱
鈹?  鈹斺攢鈹€ Common/             # 閫氱敤閫昏緫锛堝寘鍚玃VP淇敼锛?
鈹溾攢鈹€ libs/                     # 鍚勭搴?
鈹?  鈹溾攢鈹€ AILib/              # AI搴?
鈹?  鈹溾攢鈹€ ContentLib/         # 鍐呭搴?
鈹?  鈹溾攢鈹€ HttpLib/            # HTTP搴?
鈹?  鈹溾攢鈹€ ServerLib/          # 鏈嶅姟鍣ㄥ簱
鈹?  鈹溾攢鈹€ UtilitiesLib/       # 宸ュ叿搴?
鈹?  鈹斺攢鈹€ WorldLib/           # 涓栫晫搴?
鈹溾攢鈹€ PropertySheets/          # 椤圭洰灞炴€ц〃
鈹溾攢鈹€ 3rdparty/               # 绗笁鏂瑰簱
鈹斺攢鈹€ CoreGameServer.sln      # Visual Studio 瑙ｅ喅鏂规
`

## 璁稿彲璇?

璇锋牴鎹師椤圭洰璁稿彲璇佷娇鐢ㄣ€?

## 鎶€鏈敮鎸?

濡傛湁闂锛岃妫€鏌ワ細
- Visual Studio 鐗堟湰鏄惁姝ｇ‘
- 鎵€鏈変緷璧栧簱鏄惁瀹屾暣
- 缂栬瘧杈撳嚭绐楀彛鐨勯敊璇俊鎭?
