import Array "mo:base/Array";
import Nat "mo:base/Nat";

actor AnketUygulamasi {
    // Benzersiz kimlikler için sayaçlar
    var anketIdSayaci: Nat = 0;
    var soruIdSayaci: Nat = 0;

    // Anketi temsil eden yapı
    public type Anket = {
        id: Nat;
        baslik: Text;
        sorular: [Soru];
    };

    // Soruyu temsil eden yapı
    public type Soru = {
        id: Nat;
        metin: Text;
        cevaplar: [Cevap];
    };

    // Cevabı temsil eden yapı
    public type Cevap = {
        id: Nat;
        metin: Text;
        oySayisi: Nat;
    };

    // Sabit dört cevap seçeneği
    let sabitCevaplar: [Cevap] = [
        { id = 0; metin = "A"; oySayisi = 0 },
        { id = 1; metin = "B"; oySayisi = 0 },
        { id = 2; metin = "C"; oySayisi = 0 },
        { id = 3; metin = "D"; oySayisi = 0 }
    ];

    // Anketleri depolamak için bir liste
    var anketler: [Anket] = [];

    // Yeni bir anket oluşturma
    public func anketOlustur(baslik: Text): async Anket {
        let yeniAnket: Anket = {
            id = anketIdSayaci;
            baslik = baslik;
            sorular = [];
        };
        anketler := Array.append(anketler, [yeniAnket]);
        anketIdSayaci += 1;
        return yeniAnket;
    };

    
    // Anketleri listeleme
    public query func anketleriListele(): async [Anket] {
        return anketler;
    };

    // Belirli bir anketi getirme
    public query func anketGetir(anketId: Nat): async ?Anket {
        return Array.find<Anket>(anketler, func(a) { a.id == anketId });
    };
};
