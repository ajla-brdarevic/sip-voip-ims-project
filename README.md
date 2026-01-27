# SIP VoIP IMS Project

Ovaj projekat predstavlja praktičnu implementaciju i analizu SIP-baziranog VoIP sistema korištenjem **Asterisk PBX-a**, **Zoiper softphone klijenata** i **Docker** okruženja. Cilj projekta je demonstracija kompletne SIP signalizacije, registracije korisnika, uspostave poziva, SDP razmjene, logiranja i analize mrežnog saobraćaja.

---

## Pregled sistema

Sistem se sastoji od:
- **SIP servera**: Asterisk PBX pokrenut u Docker kontejneru  
- **Softphone klijenata**:
  - Client A (User Agent Client – UAC, ekstenzija 1001)
  - Client B (User Agent Server – UAS, ekstenzija 1002)
- **Transportni protokol**: SIP preko UDP-a
- **Medijski tok**: RTP

Arhitektura sistema omogućava dvosmjernu SIP komunikaciju između dva korisnika putem centralnog SIP servera.

---

## Struktura repozitorija

sip-voip-ims-project/
│
├── asterisk/
│ ├── pjsip.conf # Konfiguracija SIP endpointa (1001, 1002)
│ └── extensions.conf # Dialplan za uspostavu poziva
│
├── clients/
│ └── client-A-zoiper.md # Opis konfiguracije softphone klijenta A
│
├── docker/
│ └── run-asterisk.sh # Skripta za pokretanje Asterisk kontejnera
│
└── README.md # Opis projekta


---

## Funkcionalnosti projekta

- Inicijalizacija SIP stacka (PJSIP)
- SIP registracija korisnika (REGISTER + Digest autentikacija)
- Uspostava poziva (INVITE, 180 Ringing, 200 OK, ACK)
- Obrada dolaznih i odlaznih poziva
- SDP razmjena (codec ponuda/odgovor, RTP IP/port)
- SIP logiranje putem Asterisk CLI-ja
- Analiza SIP i RTP paketa u Wireshark-u

---

## Pokretanje Asterisk servera

Asterisk PBX se pokreće unutar Docker kontejnera:

```bash
cd docker
chmod +x run-asterisk.sh
./run-asterisk.sh
```
Otvaraju se SIP portovi:
- 5060/udp
- 5060/tcp


## Softphone klijenti

Za testiranje sistema korišten je Zoiper 5 softphone:
- Client A: ekstenzija 1001
- Client B: ekstenzija 1002

Klijenti se registruju na SIP server koristeći UDP transport i omogućavaju dvosmjernu VoIP komunikaciju.

## Analiza i testiranje
SIP signalizacija se prati pomoću:
- pjsip set logger on (Asterisk CLI)
- Wireshark filtera: sip || rtp

Analizirani su:
- SIP poruke (REGISTER, INVITE, BYE, ACK)
- SDP sadržaj
- RTP tok audio saobraćaja

## Zaključak

Projekat demonstrira kompletan tok SIP komunikacije u VoIP sistemu, od inicijalizacije i registracije korisnika do uspostave, održavanja i prekida poziva. Implementacija potvrđuje ispravan rad SIP signalizacije, SDP pregovora i RTP prenosa, te pruža jasan uvid u praktičnu primjenu SIP protokola u IMS/VoIP okruženju.

## Alati i tehnologije
- Asterisk PBX
- Docker
- Zoiper 5
- Wireshark
- SIP / SDP / RTP protokoli