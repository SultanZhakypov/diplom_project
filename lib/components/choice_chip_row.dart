import 'package:flutter/material.dart';

class ChoiceChipRow extends StatefulWidget {
  const ChoiceChipRow({
    super.key,
  });

  @override
  _ChoiceChipRowState createState() => _ChoiceChipRowState();
}

class _ChoiceChipRowState extends State<ChoiceChipRow> {
  List<String> categories = [
    'All',
    'Backend Engineer',
    'Frontend Engineer',
    'Mobile Developer',
    'UI/UX Designer',
  ];

  List<bool> isSelected = List.generate(5, (_) => false);

  List<String> programmingLanguages = [
    'Dart',
    'Java',
    'Python',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SizedBox(
            width: double.infinity,
            height: 200, // увеличиваем высоту строки до 50
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (context, index) => const SizedBox(width: 4),
              itemBuilder: (context, index) {
                return ChoiceChip(
                  label: Text(
                    categories[index],
                  ),
                  selected: isSelected[index],
                  onSelected: (selected) {
                    setState(() {
                      for (int i = 0; i < isSelected.length; i++) {
                        isSelected[i] = false;
                      }
                      isSelected[index] = selected;
                    });
                  },
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: programmingLanguages.map((language) {
            return ElevatedButton(
              onPressed: () {
                // Действие, которое должно выполняться при нажатии на кнопку языка программирования.
                print('Выбран язык: $language');
              },
              child: Text(language),
            );
          }).toList(),
        ),
      ],
    );
  }
}

