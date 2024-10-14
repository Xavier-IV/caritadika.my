module ApplicationHelper
  def navigation_data
    {
      social: [
        {
          name: "X",
          href: "https://x.com/MohdZafranudin",
          icon: "x-icon.svg"
        },
        {
          name: "GitHub",
          href: "https://github.com/Xavier-IV/caritadika.my",
          icon: "github-icon.svg"
        }
      ],
      partners: [
        { name: "SedekahJe", href: "https://sedekahje.com" },
        { name: "Kelas Mengaji Online", href: "https://kelasmengaji.online" },
        { name: "Quran Manzil", href: "https://quran-manzil.com" },
        { name: "Quran Sunnah AI", href: "https://quran-sunnah-ai.com" },
        { name: "Belasungkawa", href: "https://belasungkawa.my" },
        { name: "Meem", href: "https://usemeem.com" },
        { name: "duaa.my", href: "https://duaa.my" },
        { name: "Semak Hadis", href: "https://semakhadis.com" },
        { name: "Pantunis", href: "https://pantunis.com" }
      ],
      resources: [
        { name: "Kod Sumber Terbuka", href: "https://github.com/Xavier-IV/caritadika.my" },
        { name: "Jabatan Kebajikan Masyarakat", href: "https://www.jkm.gov.my/jkm/index.php?r=portal/index" }
      ],
      projects: [
        { name: "homelab.day", href: "https://homelab.day" }
      ]
    }
  end
end
