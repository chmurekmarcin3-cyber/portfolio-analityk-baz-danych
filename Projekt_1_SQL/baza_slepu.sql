SELECT
    produkty.nazwa,
    SUM(zamowienia.ilosc) AS sprzedane_sztuki
FROM zamowienia
JOIN produkty ON zamowienia.produkt_id = produkty.id
GROUP BY produkty.nazwa;