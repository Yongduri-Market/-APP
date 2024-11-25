import 'package:flutter/material.dart';

class CompletedSaleItem extends StatelessWidget {
  final int comments;
  final int likes;
  final Function? onTap;

  const CompletedSaleItem({super.key, required this.comments, required this.likes, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 112,
                height: 96,
                color: const Color(0xffE0EFF4),
              ),
              const Expanded(child: SizedBox()),
              const Icon(
                Icons.comment_rounded,
                color: Colors.white,
              ),
              Container(
                width: 24,
                alignment: Alignment.center,
                child: Text(
                  '$comments',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              Container(
                width: 24,
                alignment: Alignment.center,
                child: Text(
                  '$likes',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 32,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff86C3D8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      '보낸 후기 보기',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              SizedBox(
                width: 40,
                height: 32,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff86C3D8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    showBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return BottomSheetContent(
                          onTap: onTap,
                        );
                      },
                    );
                  },
                  child: const Icon(
                    Icons.edit_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BottomSheetContent extends StatelessWidget {
  final Function? onTap;

  const BottomSheetContent({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6),
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (onTap != null) {
                      onTap!();
                    }
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    '목록에서 지우기',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    '닫기',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
