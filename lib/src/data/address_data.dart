/// 시도
///
///https://sgis.kostat.go.kr/developer/html/openApi/api/dataCode/SidoCode.html
const Map<String, String> sidoMap = {
  "11": "서울특별시",
  "26": "부산광역시",
  "27": "대구광역시",
  "28": "인천광역시",
  "29": "광주광역시",
  "30": "대전광역시",
  "31": "울산광역시",
  "36": "세종특별자치시",
  "41": "경기도",
  "42": "강원도",
  "43": "충청북도",
  "44": "충청남도",
  "45": "전라북도",
  "46": "전라남도",
  "47": "경상북도",
  "48": "경상남도",
  "50": "제주특별자치도",
};

/// 시도군구
///
///
const Map<String, String> sidoguMap = {
  "11010": "종로구",
  "11020": "중구",
  "11030": "용산구",
  "11040": "성동구",
  "11050": "광진구",
  "11060": "동대문구",
  "11070": "중랑구",
  "11080": "성북구",
  "11090": "강북구",
  "11100": "도봉구",
  "11110": "노원구",
  "11120": "은평구",
  "11130": "서대문구",
  "11140": "마포구",
  "11150": "양천구",
  "11160": "강서구",
  "11170": "구로구",
  "11180": "금천구",
  "11190": "영등포구",
  "11200": "동작구",
  "11210": "관악구",
  "11220": "서초구",
  "11230": "강남구",
  "11240": "송파구",
  "11250": "강동구",
  "21010": "중구",
  "21020": "서구",
  "21030": "동구",
  "21040": "영도구",
  "21050": "부산진구",
  "21060": "동래구",
  "21070": "남구",
  "21080": "북구",
  "21090": "해운대구",
  "21100": "사하구",
  "21110": "금정구",
  "21120": "강서구",
  "21130": "연제구",
  "21140": "수영구",
  "21150": "사상구",
  "21310": "기장군",
  "22010": "중구",
  "22020": "동구",
  "22030": "서구",
  "22040": "남구",
  "22050": "북구",
  "22060": "수성구",
  "22070": "달서구",
  "22310": "달성군",
  "23010": "중구",
  "23020": "동구",
  "23040": "연수구",
  "23050": "남동구",
  "23060": "부평구",
  "23070": "계양구",
  "23080": "서구",
  "23090": "미추홀구",
  "23310": "강화군",
  "23320": "옹진군",
  "24010": "동구",
  "24020": "서구",
  "24030": "남구",
  "24040": "북구",
  "24050": "광산구",
  "25010": "동구",
  "25020": "중구",
  "25030": "서구",
  "25040": "유성구",
  "25050": "대덕구",
  "26010": "중구",
  "26020": "남구",
  "26030": "동구",
  "26040": "북구",
  "26310": "울주군",
  "29010": "세종특별자치시",
  "31011": "장안구",
  "31012": "권선구",
  "31013": "팔달구",
  "31014": "영통구",
  "31021": "수정구",
  "31022": "중원구",
  "31023": "분당구",
  "31030": "의정부시",
  "31041": "만안구",
  "31042": "동안구",
  "31050": "부천시",
  "31060": "광명시",
  "31070": "평택시",
  "31080": "동두천시",
  "31091": "상록구",
  "31092": "단원구",
  "31101": "덕양구",
  "31103": "일산동구",
  "31104": "일산서구",
  "31110": "과천시",
  "31120": "구리시",
  "31130": "남양주시",
  "31140": "오산시",
  "31150": "시흥시",
  "31160": "군포시",
  "31170": "의왕시",
  "31180": "하남시",
  "31191": "처인구",
  "31192": "기흥구",
  "31193": "수지구",
  "31200": "파주시",
  "31210": "이천시",
  "31220": "안성시",
  "31230": "김포시",
  "31240": "화성시",
  "31250": "광주시",
  "31260": "양주시",
  "31270": "포천시",
  "31280": "여주시",
  "31350": "연천군",
  "31370": "가평군",
  "31380": "양평군",
  "32010": "춘천시",
  "32020": "원주시",
  "32030": "강릉시",
  "32040": "동해시",
  "32050": "태백시",
  "32060": "속초시",
  "32070": "삼척시",
  "32310": "홍천군",
  "32320": "횡성군",
  "32330": "영월군",
  "32340": "평창군",
  "32350": "정선군",
  "32360": "철원군",
  "32370": "화천군",
  "32380": "양구군",
  "32390": "인제군",
  "32400": "고성군",
  "32410": "양양군",
  "33020": "충주시",
  "33030": "제천시",
  "33041": "상당구",
  "33042": "서원구",
  "33043": "흥덕구",
  "33044": "청원구",
  "33320": "보은군",
  "33330": "옥천군",
  "33340": "영동군",
  "33350": "진천군",
  "33360": "괴산군",
  "33370": "음성군",
  "33380": "단양군",
  "33390": "증평군",
  "34011": "동남구",
  "34012": "서북구",
  "34020": "공주시",
  "34030": "보령시",
  "34040": "아산시",
  "34050": "서산시",
  "34060": "논산시",
  "34070": "계룡시",
  "34080": "당진시",
  "34310": "금산군",
  "34330": "부여군",
  "34340": "서천군",
  "34350": "청양군",
  "34360": "홍성군",
  "34370": "예산군",
  "34380": "태안군",
  "35011": "완산구",
  "35012": "덕진구",
  "35020": "군산시",
  "35030": "익산시",
  "35040": "정읍시",
  "35050": "남원시",
  "35060": "김제시",
  "35070": "임실군",
  "35080": "진안군",
  "35090": "무주군",
  "35100": "장수군",
  "35110": "완주군",
  "35120": "고창군",
  "35130": "부안군",
  "36010": "동구",
  "36020": "서구",
  "36030": "남구",
  "36040": "북구",
  "36050": "목포시",
  "36060": "여수시",
  "36070": "순천시",
  "36080": "나주시",
  "36090": "광양시",
  "36310": "곡성군",
  "36320": "구례군",
  "36330": "고흥군",
  "36340": "보성군",
  "36350": "화순군",
  "36360": "담양군",
  "36370": "장성군",
  "36380": "완도군",
  "36390": "진도군",
  "36400": "신안군",
  "37010": "포항시",
  "37020": "경주시",
  "37030": "김천시",
  "37040": "안동시",
  "37050": "구미시",
  "37060": "영주시",
  "37070": "상주시",
  "37080": "문경시",
  "37090": "경산시",
  "37100": "청도군",
  "37110": "고령군",
  "37120": "성주군",
  "37130": "칠곡군",
  "37140": "예천군",
  "37150": "봉화군",
  "37160": "울진군",
  "37170": "영양군",
  "37180": "영덕군",
  "37190": "청송군",
  "37200": "안동군",
  "37210": "예천군",
  "38010": "창원시",
  "38020": "진주시",
  "38030": "통영시",
  "38040": "사천시",
  "38050": "김해시",
  "38060": "밀양시",
  "38070": "거창군",
  "38080": "함양군",
  "38090": "산청군",
  "38100": "의령군",
  "38110": "함안군",
  "38120": "창녕군",
  "38130": "고성군",
  "38140": "남해군",
  "38150": "하동군",
  "38160": "합천군",
  "38310": "거창군",
  "38320": "산청군",
  "38330": "함양군",
  "38340": "창녕군",
  "39010": "제주시",
  "39020": "서귀포시",
  "39310": "한림읍",
  "39320": "애월읍",
  "39330": "조천읍",
  "39340": "구좌읍",
  "39350": "성산읍",
  "39360": "우도면",
  "39370": "추자면",
  "39380": "남원읍",
  "39390": "표선면",
  "39400": "월령읍",
  "39410": "한경면",
  "39420": "대정읍",
  "39430": "안덕면",
  "39440": "세화읍",
  "39450": "성산읍",
  "39460": "대정읍",
  "39470": "애월읍",
};

const List<String> roadList = [
  "이태원로",
  "홍길동로",
  "세종로",
  "명동로",
  "테헤란로",
  "강남대로",
  "신사로",
  "강북로",
  "신촌로",
  "남산로",
  "여의도로",
  "성수로",
  "한남로",
  "목동로",
  "잠실로",
  "구로로",
  "마포로",
  "왕십리로",
  "종로",
  "송파로",
  "영등포로",
  "명일로",
  "양재로",
  "성북로",
  "동작로",
  "목련로",
  "도산대로",
  "가락로",
  "은평로",
  "불광로",
  "청량리로",
  "한성대로",
  "서초로",
  "용마산로",
  "화곡로",
  "사당로",
  "시청로",
  "역삼로",
  "공덕로",
  "구의로",
  "명지로",
  "진관로",
  "가산로",
  "신내로",
  "상계로",
  "신정로",
  "용산로",
  "마곡로",
  "대치로",
  "회현로",
  "신당로",
  "성수일로",
  "창동로",
  "상암로",
  "도봉로",
  "길동로",
  "온수로",
  "노량진로",
  "장안로",
  "길음로",
  "가양로",
  "수서로",
  "천호로",
  "신림로",
  "청담로",
  "암사로",
  "복정로",
  "신공덕로",
  "역전로",
  "방화로",
  "성균관로",
  "공항로",
  "화랑로",
  "영구로",
  "망원로",
  "원주로",
  "도봉산로",
  "과천로",
  "김포로",
  "양천로",
  "행당로",
  "종암로",
  "고척로",
  "신촌로",
  "반포로",
  "상봉로",
  "신수로",
  "여의나루로",
  "도원로",
  "장미로",
  "온천로",
  "주엽로",
  "미아로",
  "이화로",
  "강서로",
];
