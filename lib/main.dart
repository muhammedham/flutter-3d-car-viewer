import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '3D Asset Viewer',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212), 
      ),
      home: const AssetViewerScreen(),
    );
  }
}

class AssetViewerScreen extends StatelessWidget {
  const AssetViewerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GARAGE INSPECT',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: Colors.cyanAccent, // لون مناسب للسيارات
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          const Text(
            "Speedster Model-X", // فيك تغير اسم السيارة من هون
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          const Text(
            "Legendary Racing Vehicle",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 20),
          
          // مساحة العرض ثلاثية الأبعاد
          Expanded(
            child: ModelViewer(
              backgroundColor: const Color(0xFF121212),
              src: 'assets/car1.glb', // مسار ملف سيارتك
              alt: 'A 3D model of a racing car',
              ar: true,           
              autoRotate: true,   // السيارة رح تلف لحالها ببطء
              cameraControls: true, // بيقدر المستخدم يلفها ويكبرها بإيده
              disableZoom: false,
            ),
          ),
          
          // أزرار التحكم بالأسفل
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // الزر الأول: الإحصائيات
                ElevatedButton.icon(
                  onPressed: () {
                    // كود إظهار نافذة الإحصائيات
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Colors.grey[900],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        title: const Text(
                          "VEHICLE STATS", 
                          style: TextStyle(color: Colors.cyanAccent, fontWeight: FontWeight.bold)
                        ),
                        content: const Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("🚀 Top Speed: 340 km/h", style: TextStyle(color: Colors.white, fontSize: 16)),
                            SizedBox(height: 10),
                            Text("⏱️ Acceleration: 0-100 in 2.1s", style: TextStyle(color: Colors.white, fontSize: 16)),
                            SizedBox(height: 10),
                            Text("⚙️ Engine: V8 Twin-Turbo", style: TextStyle(color: Colors.white, fontSize: 16)),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("CLOSE", style: TextStyle(color: Colors.cyanAccent)),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.analytics_outlined),
                  label: const Text("VEHICLE STATS"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                ),
                
                // الزر الثاني: تجربة القيادة
                ElevatedButton.icon(
                  onPressed: () {
                    // كود إظهار إشعار سفلي
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                          "🏎️ Engine Started! Ready for the track...",
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        backgroundColor: Colors.cyanAccent,
                        duration: const Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    );
                  },
                  icon: const Icon(Icons.speed), 
                  label: const Text("TEST DRIVE"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyanAccent,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}