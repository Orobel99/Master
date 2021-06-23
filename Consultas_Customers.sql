
--Se requiere consultar todos los clientes con más de 5 contactos--

SELECT H.CUSTOMER_ID, H.CUSTOMER_NAME1,H.RFC_ID,H.CUSTOMER_EMAIL
FROM Customer_Header H
WHERE (SELECT COUNT(HC.CONTACT_ID) 
	   FROM Customer_Header HC 
	   WHERE H.CONTACT_ID = HC.CONTACT_ID) > 5;
	   
	   
--Se requiere conocer a los contactos que cuenten con teléfono móvil y fijo.--

SELECT H.CUSTOMER_ID, H.CUSTOMER_NAME1, H.CONTACT_ID, 
	   C.CONTACT_NAME, C.CONTACT_MIDLENAME, C.CONTACT_LASTNAME, C.CONTACT_POSITION,
	   PT.CONTACT_TYPE_ID,PT.PHONE_TYPE, C.PHONE
FROM Customer_Header H, Customer_Contact CC, Contact C, Contact_Phone_Type PT
WHERE H.CUSTOMER_ID = CC.CUSTOMER_ID
AND H.CONTACT_ID = CC.CONTACT_ID
AND CC.CONTACT_ID = C.CONTACT_ID
AND C.CONTACT_TYPE_ID = PT.CONTACT_TYPE_ID
ORDER BY PT.PHONE_TYPE;


--Se requiere conocer a los clientes que tengan dirección en CDMX y Monterrey.--

SELECT H.CUSTOMER_ID, H.CUSTOMER_NAME1, H.CONTACT_ID, 
	   CA.ADDRESS_ID,CA.LINE1||" "||CA.LINE2||" "||CA.LINE3, CA.ZIP_POSTCODE, CA.NAME_SETTLEMENT
	   ZP.NAME_PROVINCE, ZP.NAME_STATE, ZP.NAME_CITY
FROM Customer_Header H, Customer_Addresses CA, Zip_Postcode ZP
WHERE H.CUSTOMER_ID = CA.CUSTOMER_ID
AND H.ADDRESS_ID = CA.ADDRESS_ID
AND CA.ZIP_POSTCODE = ZP.ZIP_POSTCODE
AND (ZP.NAME_CITY LIKE 'Ciudad de México' 
  OR ZP.NAME_CITY LIKE 'Monterrey');
  


