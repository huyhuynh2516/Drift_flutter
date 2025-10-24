import 'package:flutter/material.dart';
import '../model/linhkien.dart';

class ComponentCard extends StatelessWidget {
  final Component linhkien;
  final String? categoryName;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;

  const ComponentCard({
    Key? key,
    required this.linhkien,
    this.categoryName,
    this.onTap,
    this.onDelete,
    this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Stack(
        children: [
          // --- Toàn bộ thân card ---
          InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ẢNH
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: linhkien.image != null && linhkien.image!.isNotEmpty
                        ? Image.asset(
                      linhkien.image!,
                      height: 70,
                      width: 70,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image, size: 50),
                    )
                        : const Icon(Icons.memory,
                        size: 50, color: Colors.grey),
                  ),
                  const SizedBox(height: 7),

                  // TÊN LINH KIỆN
                  Text(
                    linhkien.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 6),

                  // LOẠI LINH KIỆN
                  if (categoryName != null)
                    Text(
                      categoryName!,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.blueGrey,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                  const SizedBox(height: 8),

                  // GIÁ + SỐ LƯỢNG
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.attach_money,
                              color: Colors.green, size: 18),
                          Text(
                            linhkien.gia.toStringAsFixed(0),
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.bar_chart,
                              color: Colors.red, size: 18),
                          Text(
                            linhkien.soluong.toString(),
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // --- Nút SỬA (góc trái) ---
          Positioned(
            top: 0,
            left: 0,
            child: IconButton(
              icon: const Icon(Icons.edit, color: Colors.blueAccent),
              tooltip: 'Sửa giá & số lượng',
              onPressed: onEdit,
            ),
          ),

          // --- Nút XÓA (góc phải) ---
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              tooltip: 'Xóa linh kiện',
              onPressed: onDelete,
            ),
          ),
        ],
      ),
    );
  }
}
