# İnsan mı, Yapay Zekâ mı? • 3D Keşif Oyunu 🤖❤️

6 yaş grubu için hazırlanmış, sesli ve dokunmatik destekli **yapay zekâ okuryazarlığı** sınıflandırma oyunu. Öğrenciler özellik kartlarını **İnsan** ya da **Yapay Zekâ** kutusuna sürükleyerek (veya dokunarak) doğru kavramları öğrenir.

## 🎮 Özellikler

- **16 özellik kartı** — yemek yemek, uyumak, müzik açmak, hayvanı tanımak vb.
- **3D kart eğimi** — fare ile kartın üstünde gezinince kart eğilir (tilt efekti)
- **Sürükle-bırak + dokunmatik** — masaüstünde sürükleme, tablette parmakla kaydırma
- **Türkçe sesli anlatım** — Web Speech API ile sorular sesli okunur (tekrar dinleme butonu dahil)
- **Web Audio ses efektleri** — sıfır bağımlılık, tarayıcıda sentezlenen neşeli sesler
- **Konfeti kutlaması** — her doğru cevapta ve oyun sonunda
- **Klavye erişilebilirliği** — Sol/Sağ ok tuşlarıyla cevap verme

## 🚀 Çalıştırma

Ek kurulum gerekmez; `index.html` dosyasını tarayıcıda açmak yeterli.

İsterseniz küçük bir yerel sunucu ile de çalıştırabilirsiniz (Windows PowerShell):

```powershell
.\tools\serve.ps1          # http://127.0.0.1:8642/
.\tools\serve.ps1 -Port 9000
```

## 📁 Dosyalar

| Dosya | Açıklama |
|---|---|
| `index.html` + `style.css` + `game.js` | Ana sürüm (ayrı dosyalar) |
| `standalone.html` | Tek dosyalık taşınabilir sürüm (projeksiyon/USB için) |
| `tools/serve.ps1` | Bağımlılıksız yerel sunucu betiği |

## 🌐 Canlı sürüm

GitHub Pages üzerinden yayında: **https://bilfen.github.io/insan-mi-yapay-zeka-3d/**

---

*Hazırlayan: Bilfen Eğitim Kurumları • 6 yaş etkinliği*
