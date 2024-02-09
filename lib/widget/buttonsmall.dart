import 'package:flutter/material.dart';

SizedBox buttonSmall(bool isDOne) {
    return SizedBox(
      height: 48,
      width: 200,
      child: ElevatedButton(
        onPressed: () {},
        child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDOne ? Colors.green : Colors.blueGrey),
            child: isDOne
                ? const Icon(
                    Icons.done,
                    size: 40,
                  )
                : const CircularProgressIndicator()),
      ),
    );
  }