import 'package:flutter/material.dart';

class CircleKeyboard extends StatefulWidget {
  final Function(String) onValueChanged;
  final String initialValue;

  const CircleKeyboard({
    super.key,
    required this.onValueChanged,
    this.initialValue = '',
  });

  @override
  State<CircleKeyboard> createState() => _CircleKeyboardState();
}

class _CircleKeyboardState extends State<CircleKeyboard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String currentValue = '';

  // 各セクションの値
  String hall = '';
  String block = '';
  String number = '';
  String prefix = '';
  String wallPlacement = '';

  @override
  void initState() {
    super.initState();
    currentValue = widget.initialValue;
    _tabController = TabController(length: 5, vsync: this);

    // 初期値があれば分解する処理をここに追加
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _updateValue() {
    currentValue = '$hall$block$number$prefix$wallPlacement';
    widget.onValueChanged(currentValue);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.grey[200],
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    currentValue.isEmpty ? 'ここに入力結果が表示されます' : currentValue,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.backspace),
                  onPressed: () {
                    // 最後の入力を削除する処理
                    if (wallPlacement.isNotEmpty) {
                      setState(() {
                        wallPlacement = '';
                        _updateValue();
                      });
                    } else if (prefix.isNotEmpty) {
                      setState(() {
                        prefix = '';
                        _updateValue();
                      });
                    } else if (number.isNotEmpty) {
                      setState(() {
                        number = '';
                        _updateValue();
                      });
                    } else if (block.isNotEmpty) {
                      setState(() {
                        block = '';
                        _updateValue();
                      });
                    } else if (hall.isNotEmpty) {
                      setState(() {
                        hall = '';
                        _updateValue();
                      });
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      hall = '';
                      block = '';
                      number = '';
                      prefix = '';
                      wallPlacement = '';
                      _updateValue();
                    });
                  },
                ),
              ],
            ),
          ),
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'ホール'),
              Tab(text: 'ブロック'),
              Tab(text: '番号'),
              Tab(text: 'プリフィックス'),
              Tab(text: '壁配置'),
            ],
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildHallKeyboard(),
                _buildBlockKeyboard(),
                _buildNumberKeyboard(),
                _buildPrefixKeyboard(),
                _buildWallPlacementKeyboard(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ホールキーボード
  Widget _buildHallKeyboard() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('現在の選択: $hall', style: const TextStyle(fontSize: 16)),
          ),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              _buildKeyButton('西', () {
                setState(() {
                  hall = '西';
                  _updateValue();
                });
              }),
              _buildKeyButton('東', () {
                setState(() {
                  hall = '東';
                  _updateValue();
                });
              }),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: '数字を入力',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (value.isNotEmpty && int.tryParse(value) != null) {
                      setState(() {
                        if (hall == '西' || hall == '東') {
                          hall = '$hall$value' + 'ホール';
                        } else {
                          hall = '$value' + '号館';
                        }
                        _updateValue();
                      });
                    }
                  },
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  _tabController.animateTo(1); // 次のタブへ
                },
                child: const Text('次へ'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ブロックキーボード
  Widget _buildBlockKeyboard() {
    List<String> hiragana = [
      'あ',
      'い',
      'う',
      'え',
      'お',
      'か',
      'き',
      'く',
      'け',
      'こ',
      'さ',
      'し',
      'す',
      'せ',
      'そ',
      'た',
      'ち',
      'つ',
      'て',
      'と',
      'な',
      'に',
      'ぬ',
      'ね',
      'の',
      'は',
      'ひ',
      'ふ',
      'へ',
      'ほ',
      'ま',
      'み',
      'む',
      'め',
      'も',
      'や',
      'ゆ',
      'よ',
      'ら',
      'り',
      'る',
      'れ',
      'ろ',
      'わ',
      'を',
      'ん',
    ];

    List<String> alphabets = [
      'A',
      'B',
      'C',
      'D',
      'E',
      'F',
      'G',
      'H',
      'I',
      'J',
      'K',
      'L',
      'M',
      'N',
      'O',
      'P',
      'Q',
      'R',
      'S',
      'T',
      'U',
      'V',
      'W',
      'X',
      'Y',
      'Z',
    ];

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('現在の選択: $block', style: const TextStyle(fontSize: 16)),
          ),
          const TabBar(
            tabs: [Tab(text: 'ひらがな'), Tab(text: 'アルファベット')],
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
          ),
          Expanded(
            child: TabBarView(
              children: [
                // ひらがなタブ
                SingleChildScrollView(
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children:
                        hiragana
                            .map(
                              (char) => _buildKeyButton(char, () {
                                setState(() {
                                  block = char;
                                  _updateValue();
                                  _tabController.animateTo(2); // 次のタブへ
                                });
                              }),
                            )
                            .toList(),
                  ),
                ),
                // アルファベットタブ
                SingleChildScrollView(
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children:
                        alphabets
                            .map(
                              (char) => _buildKeyButton(char, () {
                                setState(() {
                                  block = char;
                                  _updateValue();
                                  _tabController.animateTo(2); // 次のタブへ
                                });
                              }),
                            )
                            .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 番号キーボード
  Widget _buildNumberKeyboard() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('現在の選択: $number', style: const TextStyle(fontSize: 16)),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              childAspectRatio: 1.5,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: 100,
            itemBuilder: (context, index) {
              String num = index.toString().padLeft(2, '0');
              return _buildKeyButton(num, () {
                setState(() {
                  number = num;
                  _updateValue();
                  _tabController.animateTo(3); // 次のタブへ
                });
              });
            },
          ),
        ),
      ],
    );
  }

  // プリフィックスキーボード
  Widget _buildPrefixKeyboard() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('現在の選択: $prefix', style: const TextStyle(fontSize: 16)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildKeyButton('a', () {
              setState(() {
                prefix = 'a';
                _updateValue();
                _tabController.animateTo(4); // 次のタブへ
              });
            }),
            const SizedBox(width: 16),
            _buildKeyButton('b', () {
              setState(() {
                prefix = 'b';
                _updateValue();
                _tabController.animateTo(4); // 次のタブへ
              });
            }),
          ],
        ),
      ],
    );
  }

  // 壁配置キーボード
  Widget _buildWallPlacementKeyboard() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '現在の選択: $wallPlacement',
            style: const TextStyle(fontSize: 16),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildKeyButton('壁あり', () {
              setState(() {
                wallPlacement = '壁あり';
                _updateValue();
              });
            }),
            const SizedBox(width: 16),
            _buildKeyButton('壁なし', () {
              setState(() {
                wallPlacement = '壁なし';
                _updateValue();
              });
            }),
          ],
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, currentValue);
          },
          child: const Text('完了'),
        ),
      ],
    );
  }

  Widget _buildKeyButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(12)),
      child: Text(text),
    );
  }
}
