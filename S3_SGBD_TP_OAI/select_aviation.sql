/* Aviation */

-- Q1 Afficher les numéros de vols au départ de Paris.
SELECT volno FROM vol WHERE lower(voldep) = 'paris';
-- Q2 Afficher les numéros de pilotes en service sur des vols et la ville d'arrivée de leur vol.
SELECT p.pilno, v.volarr FROM pilote p JOIN vol v ON p.pilno = v.pilno;
-- Q3 Afficher les caractéristiques de tous les AIRBUS
SELECT * FROM avion WHERE lower(avnom) LIKE 'airbus%';
-- Q4 Afficher les noms des pilotes qui habitent PARIS (autre que JEAN)
SELECT pilno, pilote.pilnom FROM pilote WHERE pilote.piladr = 'PARIS' AND pilote.pilnom != 'JEAN';
-- Q5 Afficher les avions de capacité supérieure à 250 localisés à PARIS
SELECT * FROM avion WHERE avcap > 250 AND lower(avloc) = 'paris';
-- Q6 Afficher les avions de capacité supérieure à 250 ou localisés à PARIS
SELECT * FROM avion WHERE avcap > 250 OR lower(avloc) = 'paris';
-- Q7 Pour chaque pilote en service, afficher le nom du pilote, l'adresse du pilote et le numéro de l'avion piloté. Trier par nom de pilote.
SELECT pilnom, piladr, pilno FROM pilote ORDER BY pilnom;
-- Q8 Afficher les noms des pilotes qui pilotent un avion au départ de PARIS.
SELECT pilnom FROM pilote JOIN vol ON pilote.pilno = vol.pilno WHERE lower(voldep) = 'paris';
-- Q9 Afficher les noms des pilotes qui pilotent un AIRBUS.
SELECT pilnom FROM pilote JOIN vol ON pilote.pilno = vol.pilno JOIN avion ON vol.avno = avion.avno WHERE lower(avnom) = 'airbus';
-- Q10 Afficher la liste des vols triés par nom de pilote croissant et par nom d'avion croissant.
SELECT vol.*, pilote.pilnom, avion.avnom FROM vol JOIN pilote ON vol.pilno = pilote.pilno JOIN avion ON avion.avno = vol.avno ORDER BY pilnom, avnom;
-- Q11 Afficher le nombre de vols qui partent de Paris
SELECT count(*) FROM vol WHERE lower(voldep) = 'paris';
-- Q12 Afficher le nom des pilotes qui sont affectés à un vol à partir de la ville où ils habitent
SELECT DISTINCT pilnom FROM pilote JOIN vol ON piladr = vol.voldep;
-- Q13 Quel pilote a le salaire le plus élevé
SELECT * FROM pilote WHERE pilsal = (SELECT max(pilsal) FROM pilote);
SELECT * FROM pilote ORDER BY pilsal DESC LIMIT 1;

SELECT max(pilsal) FROM pilote;
-- Q14 Quel est le salaire moyen des pilotes affectés à un vol au départ de Paris
SELECT round(avg(pilsal),2), count(*) FROM pilote JOIN vol ON pilote.pilno = vol.pilno WHERE lower(vol.voldep) = 'paris';
-- SELECT round(avg(pilsal),2), count(*) FROM pilote JOIN vol ON pilote.pilno = vol.pilno GROUP BY lower(vol.voldep) = 'paris';
-- Q15 Quel est le salaire moyen des pilotes habitant à Paris et ayant déjà volé sur un AIRBUS
SELECT DISTINCT avg(pilsal) FROM pilote JOIN vol ON pilote.pilno = vol.pilno JOIN avion ON vol.avno = avion.avno WHERE lower(pilote.piladr) = 'paris' AND lower(avion.avnom) LIKE 'airbu%';
-- Q16 Afficher pour chaque pilote son nom et le nombre de vols auxquels il est affecté. Trier le résultat du pilote ayant le plus d'affectation à celui en ayant le moins.
SELECT pilote.pilnom, count(vol.*) FROM pilote JOIN vol ON pilote.pilno = vol.pilno GROUP BY pilote.pilnom ORDER BY count(vol.*) DESC;
-- Q17 Combien d'avion BOEING ou AIRBUS sont localisés à Paris
SELECT count(*) FROM avion WHERE (lower(avnom) LIKE 'boei%' OR lower(avnom) LIKE 'airbu%') AND lower(avloc) = 'paris';
-- Q18 Quelle est la capacité moyenne des avions par modèle
SELECT round(avg(avcap),2), avnom FROM avion GROUP BY avnom;
-- Q19 afficher les vols qui sont des aller-retours (vol de ville A vers ville B et Vol de ville B vers ville A)
SELECT * FROM vol as volall JOIN vol as volrts ON  volall.volarr = volrts.voldep AND volrts.volarr = volall.voldep;
-- Q20 afficher le nombre de vols affectés à des avions localisé dans la ville d'origine ?
SELECT count(vol.*) FROM vol JOIN avion ON vol.avno = avion.avno AND avion.avloc IN (vol.voldep, vol.volarr);
-- Q21 Afficher le nombre d'avions localisés par ville
SELECT count(*), avloc FROM avion GROUP BY avloc;
-- Q22 Quel est le salaire maximum des pilote par ville d'habitation
SELECT max(pilsal), piladr FROM pilote GROUP BY piladr;
-- Q23 Quel est le pilote ayant le salaire maximum par ville d'habitation

-- Q24 existe-t-il au moins 2 vols au départ de marseille, afficher "OUI" ou "NON" 

-- Q25 Combien de pilotes sont affectés à un vol à partir ou à destination de la ville où ils habitent

-- Q26 Quels sont les pilotes ayant un homonyme (il existe un autre pilote avec le même nom)

-- Q27 Si l'on considère qu'il y a toujours 100 passager sur chaque vol, quelle est le pourcentage d'occupation pour chaque vol.

-- Q28 Quels pilote n'ont jamais volé sur un airbus ?

-- Q29 Quels avions n'ont jamais été affectés à des vols afficher le nom et la ville de localisation de ces avions. 

-- Q30 Lister toutes les villes : celles où sont stationnés des avions, celles où habitent des pilote et les villes de départ et arrivée de vols.
