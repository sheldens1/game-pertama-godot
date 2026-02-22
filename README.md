# 🕹️ Hindar AVO - Game 2D Pertama

[![Godot Engine](https://img.shields.io/badge/Godot-4.x-blue?logo=godot-engine&logoColor=white)](https://godotengine.org)
[![Developer](https://img.shields.io/badge/Developer-kyytech-green)](https://github.com/sheldens1)

Proyek game 2D sederhana yang dibangun menggunakan **Godot Engine 4.x**. Game ini merupakan hasil eksperimen pertama saya dalam memahami *game logic*, *signal handling*, dan *collision detection*.

## 📝 Deskripsi Proyek
"Hindar musuh" adalah game bertahan hidup sederhana di mana pemain harus menghindari musuh (mobs) yang muncul dari pinggir layar. Semakin lama bertahan, semakin tinggi skor yang didapat.

Proyek ini mencakup implementasi:
* **Kinematic Movement**: Pergerakan player yang responsif.
* **Signal System**: Komunikasi antar node (HUD, Main, dan Player).
* **Randomized Spawning**: Musuh muncul secara acak menggunakan `Path2D` dan `PathFollow2D`.
* **UI/UX Dasar**: Sistem skor real-time dan transisi Game Over.

## 🛠️ Tech Stack
* **Engine**: Godot v4.6.1-stable
* **Scripting**: GDScript
* **Environment**: WSL (Ubuntu) / Windows

## 🚀 Fitur Utama
- [x] Kontrol pemain menggunakan arah (atas, bawah, kiri, kanan).
- [x] Animasi karakter dinamis (Walk & Up).
- [x] Sistem skor otomatis berbasis waktu.
- [x] Tombol Start dan Reset fungsional.

## 📂 Struktur Folder Utama
```text
.
├── player.tscn / .gd   # Logic dan visualisasi pemain
├── main.tscn / .gd     # Scene utama dan pengelolaan game loop
├── hud.tscn / .gd      # Interface skor, pesan, dan tombol
└── art/                # Aset visual (jika ada)
