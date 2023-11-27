SELECT i."Title" AS "Название", sum(p."Amount") AS "Сумма" 
FROM "Payments" AS p
JOIN "Items" AS i on p."ItemId" = i."Id"
LEFT JOIN "PromoCodes" AS pc on p."PromoCodeId" = pc."Id"
WHERE p."Status" = 4
GROUP BY i."Title"; -- Часть 1


SELECT u."UserName", u."FirstName", u."LastName"
FROM "Payments" AS p
JOIN "Items" AS i on p."ItemId" = i."Id"
JOIN "Users" AS u on p."UserId" = u."Id"
WHERE i."Price" = (SELECT MAX("Price") FROM "Items"); -- Часть 2

/*select i."Title" AS "Название", CASE WHEN pc."IsActive" THEN i."Price" - pc."Price" ELSE null END as "Скидка", p."Amount" as "Заплатил", i."Price" as "Нач.Цена"
FROM "Payments" AS p
JOIN "Items" AS i on p."ItemId" = i."Id"
LEFT JOIN "PromoCodes" AS pc on p."PromoCodeId" = pc."Id"
WHERE p."Status" = 4;
Select * from "PromoCodes"*/