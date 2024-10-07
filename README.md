# Faker Korean

## What is Faker_Korean (Eng)

Faker Korean is heavily inspired by like other Fakers, such as PHP Faker and, Python Faker.

Faker is generating fake data for test, or dummy data.
But, Some of theses are not suit in Korean. So, I make this package for you.

Tried to localize non-Korean data such as addresses, names, phone numbers, banks, and Lorem Ipsum.

For additional comments and bug reports, please use the Issue tab.

## What is Faker_Korean (Ko)

<Ko>
Faker Korean은 다른 Faker부류의 더미 데이터 생성기와 같은 역할을 합니다.

하지만, 개인적인 고충으로 한국어와 정책에 맞는 더미데이터를 생성하기 힘들다는 판단하에 만든 한국어 전용 더미데이터 입니다.

주소, 이름, 전화번호, 은행, Lorem Ipsum같이 힌국어가 아닌 데이터들을 현지화 시켜보려고 노력했습니다.

추가적인 의견 및 버그 제보는 Issue 탭을 이용해주시면 감사하겠습니다.
<Ko/>

---

## Simple Usage

```dart
// Make Simple Instance
final FakerK faker = FakerK();

// or make Instance With Seed for Fixed Random Value
final Faker fakerWSeed = FakerK(seed : 777);

// Make String dummy easily
String name = faker.names.familyName

print(name) // '홍'

// or Make String dummy with options
String fullName = faker.names.fullNames(separatorString: ' '); // separator is WhiteSpace

print(fullName) // '홍 길동'

// You can also get Logo Images, like Bank, in Korean.
// c.f) It will require `async` method for use parse `.svg` image to `MemoryImage`
ImageProvider logoImage = await faker.bank.bankImage;

// e.g) use with Widget
Image(image: logoImage),


```

## Supported Method

### Address

| **Method Name** | **Param**  | **Return Type** | **Example**             |
| --------------- | ---------- | --------------- | ----------------------- |
| `fullAddress`   | (`Getter`) | `String`        | `address.fullAddress`   |
| `siAddress`     | (`Getter`) | `String`        | `address.siAddress`     |
| `sidoguAddress` | (`Getter`) | `String`        | `address.sidoguAddress` |
| `roadAddress`   | (`Getter`) | `String`        | `address.roadAddress`   |
| `detailAddress` | (`Getter`) | `String`        | `address.detailAddress` |
| `postalCode`    | (`Getter`) | `String`        | `address.postalCode`    |

### Bank

| **Method Name** | **Param**           | **Return Type**         | **Example**                      |
| --------------- | ------------------- | ----------------------- | -------------------------------- |
| `account`       | digits(`int?`)      | `String`                | `bank.account(digits: 12)`       |
| `bankName`      | (`Getter`)          | `String`                | `bank.bankName`                  |
| `bankImage`     | size(`double = 24`) | `Future<ImageProvider>` | `await bank.bankImage(size: 30)` |
| `bankAll`       | size(`double = 24`) | `Future<BankModel>`     | `await bank.bankAll(size: 30)`   |

<details>
    <summary> BankModel</summary>
<pre>

| **Field Name** | **Type**        | **Description**  | **Example**                 |
| -------------- | --------------- | ---------------- | --------------------------- |
| `bankCode`     | `String`        | 은행의 코드      | `'001'` // 국가지정은행코드 |
| `bankName`     | `String`        | 은행의 이름      | `'국민은행'`                |
| `bankImage`    | `ImageProvider` | 은행 로고 이미지 | `MemoryImage`               |
| `account`      | `String`        | 계좌 번호        | `'12345678901234'`          |

</pre>
</details>

### Image

| **Method Name** | **Param**                                                                                 | **Return Type**       | **Example**                                                 |
| --------------- | ----------------------------------------------------------------------------------------- | --------------------- | ----------------------------------------------------------- |
| `imageUrl`      | width(`int`), height(`int`), random(`int?`), seed(`String?`), imageFormat(`ImageFormat?`) | `String`              | `images.imageUrl(width: 300, height: 300, seed: 'abc')`     |
| `imagesUrl`     | length(`int?`), width(`int`), height(`int`), seed(`String?`), imageFormat(`ImageFormat?`) | `List<String>`        | `images.imagesUrl(3, width: 300, height: 300, seed: 'abc')` |
| `image`         | width(`int`), height(`int`), random(`int?`), seed(`String?`), imageFormat(`ImageFormat?`) | `ImageProvider`       | `images.image(width: 300, height: 300, seed: 'abc')`        |
| `images`        | length(`int?`), width(`int`), height(`int`), seed(`String?`), imageFormat(`ImageFormat?`) | `List<ImageProvider>` | `images.images(3, width: 300, height: 300, seed: 'abc')`    |

<details>
<summary> ImageFormat</summary>
<pre>

```dart
enum ImageFormat { jpg, webp }
```

</pre>
</details>

### Internet

| **Method Name**   | **Param**  | **Return Type** | **Example**                |
| ----------------- | ---------- | --------------- | -------------------------- |
| `id`              | (`Getter`) | `String`        | `internet.id`              |
| `email`           | (`Getter`) | `String`        | `internet.email`           |
| `disposableEmail` | (`Getter`) | `String`        | `internet.disposableEmail` |
| `pw`              | (`Getter`) | `String`        | `internet.pw`              |
| `url`             | (`Getter`) | `String`        | `internet.url`             |
| `uri`             | (`Getter`) | `Uri`           | `internet.uri`             |
| `macAddress`      | (`Getter`) | `String`        | `internet.macAddress`      |

### Lipsum

| **Method Name** | **Param**                    | **Return Type** | **Example**                          |
| --------------- | ---------------------------- | --------------- | ------------------------------------ |
| `word`          | maxLen(`int`), minLen(`int`) | `String`        | `lipsum.word(maxLen: 7, minLen: 5)`  |
| `sentence`      | wordCount(`int`)             | `String`        | `lipsum.sentence(wordCount: 5)`      |
| `paragraph`     | sentenceCount(`int`)         | `String`        | `lipsum.paragraph(sentenceCount: 5)` |

### Name

| **Method Name** | **Param**                 | **Return Type** | **Example**                             |
| --------------- | ------------------------- | --------------- | --------------------------------------- |
| `fullName`      | separatorString(`String`) | `String`        | `names.fullName(separatorString = '-')` |
| `lastName`      | (`Getter`)                | `String`        | `names.lastName`                        |
| `familyName`    | (`Getter`)                | `String`        | `names.familyName`                      |

### Phone

| **Method Name** | **Param**           | **Return Type** | **Example**                          |
| --------------- | ------------------- | --------------- | ------------------------------------ |
| `telNumber`     | separator(`String`) | `String`        | `phone.telNumber(separator = '-')`   |
| `phoneNumber`   | separator(`String`) | `String`        | `phone.phoneNumber(separator = '-')` |

## TO-DO

This package will be supported to plan.

### Address

- A method to link with the address used in the Korean government public data portal

<ko>

- 정부 공공데이터 포털에서 사용하고 있는 주소랑 연동 시킬수 있는 방안

  -> 현재 코드는 시는 삽입 끝

<ko/>

### ETC

- If a method that can be provided by a general Faker needs to be localized in Korea, it will be localized, and those that are not will be provided as is.

<ko>

- 일반적인 Faker에서 제공할 수 있는 Method를 한국 현지화가 필요한것이면, 현지화 시키고, 아닌 것들은 그냥 그대로 제공할 예정

</ko>
