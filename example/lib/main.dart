import 'package:faker_korean/faker_korean.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FakerK Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const String noData = 'No Data';
  String? name;
  String? address;
  BankModel? bank;
  String? tel;
  String? phone;
  String? word;
  String? sentence;
  String? paragraph;
  String? id;
  String? email;
  String? pw;
  String? url;
  String? uri;
  String? macAddress;
  List<ImageProvider>? imageList;

  final FakerK faker = FakerK();

  int imageLength = 3;

  void clearAllVariables() {
    name = null;
    address = null;
    bank = null;
    tel = null;
    phone = null;
    word = null;
    sentence = null;
    paragraph = null;
    id = null;
    email = null;
    pw = null;
    url = null;
    uri = null;
    macAddress = null;
    imageList = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FakerK'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BuildSection(
                onPressed: () {
                  name = faker.names.fullName();
                  setState(() {});
                },
                showWidget: Text(name ?? noData),
                whatMake: 'Names',
              ),
              BuildSection(
                showWidget: Text(address ?? noData),
                whatMake: 'FullAddress',
                onPressed: () {
                  address = faker.address.fullAddress;
                  setState(() {});
                },
              ),
              BuildSection(
                showWidget: bank != null
                    ? Column(
                        children: [
                          Image(image: bank!.bankImage),
                          Text(bank!.bankName),
                          Text(bank!.bankCode),
                          Text(bank!.account),
                        ],
                      )
                    : const Text(noData),
                whatMake: 'Bank',
                onPressed: () async {
                  bank = await faker.bank.bankAll(size: 100);
                  setState(() {});
                },
              ),
              BuildSection(
                showWidget: Text(tel ?? noData),
                whatMake: 'Tel',
                onPressed: () {
                  tel = faker.phone.telNumber();
                  setState(() {});
                },
              ),
              BuildSection(
                showWidget: Text(phone ?? noData),
                whatMake: 'Phone',
                onPressed: () {
                  phone = faker.phone.phoneNumber();
                  setState(() {});
                },
              ),
              BuildSection(
                showWidget: Text(word ?? noData),
                whatMake: 'Word',
                onPressed: () {
                  word = faker.lipsum.word();
                  setState(() {});
                },
              ),
              BuildSection(
                showWidget: Text(sentence ?? noData),
                whatMake: 'Sentence',
                onPressed: () {
                  sentence = faker.lipsum.sentence();
                  setState(() {});
                },
              ),
              BuildSection(
                showWidget: Text(paragraph ?? noData),
                whatMake: 'Paragraph',
                onPressed: () {
                  paragraph = faker.lipsum.paragraph();
                  setState(() {});
                },
              ),
              BuildSection(
                showWidget: Text(id ?? noData),
                whatMake: 'Id',
                onPressed: () {
                  id = faker.internet.id;
                  setState(() {});
                },
              ),
              BuildSection(
                showWidget: Text(pw ?? noData),
                whatMake: 'Pw',
                onPressed: () {
                  pw = faker.internet.pw;
                  setState(() {});
                },
              ),
              BuildSection(
                showWidget: Text(url ?? noData),
                whatMake: 'Url',
                onPressed: () {
                  url = faker.internet.url;
                  setState(() {});
                },
              ),
              BuildSection(
                showWidget: Text(uri ?? noData),
                whatMake: 'Uri',
                onPressed: () {
                  uri = faker.internet.uri.toString();
                  setState(() {});
                },
              ),
              BuildSection(
                showWidget: Text(macAddress ?? noData),
                whatMake: 'MacAddress',
                onPressed: () {
                  macAddress = faker.internet.macAddress;
                  setState(() {});
                },
              ),
              BuildSection(
                showWidget: imageList != null && imageList!.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: imageLength,
                        itemBuilder: (context, index) => Image(
                          image: imageList![index],
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        ),
                      )
                    : const Text(noData),
                whatMake: 'Image',
                onPressed: () {
                  imageList = faker.images.images(imageLength);
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => clearAllVariables(),
        tooltip: 'Clear All Variables',
        child: const Icon(
          Icons.clear,
        ),
      ),
    );
  }
}

class BuildSection extends StatelessWidget {
  const BuildSection({
    super.key,
    required this.showWidget,
    required this.whatMake,
    required this.onPressed,
  });
  final Widget showWidget;
  final String whatMake;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          showWidget,
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: onPressed,
            child: Text("Make $whatMake"),
          ),
        ],
      ),
    );
  }
}
