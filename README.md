### Szövegdobozba írás

```
Send Info_Box "SZÖVEG" "ABLAK NEVE"
```

### Értékadás

```
Move (ÉRTÉK) to VÁLTOZÓ
```

### Vezérlési szerkezetek

#### for loop

```
For INDEXER from KEZDŐ to VÉGSŐ
	// TÖRTÉNÉS
Loop
```

### Függvények, metódusok

#### Függvény

```
Function NÉV PARAMÉTER(EK) Returns VISSZATÉRÉSI-TÍPUS
	// kód
	Function_Return (VISSZATÉRÉSI-ÉRTÉK)
End_Function
```

#### Eljárás

```
Procedure NÉV PARAMÉTER(EK)
	// kód
End_Procedure
```

#### Paraméter referencia szerint

**Függvény/eljárás írásakor**

```
TÍPUS ByRef NÉV
```

**Híváskor**

```
NÉV(&PARAMÉTER)
```

#### Függvény hívás

```
Get FÜGGVÉNY PARAMÉTER(EK) to VÁLTOZÓ
```

### Tömbök

```
TÍPUS[] NÉV
```

#### Tömb rendezés

```
SortArray(NÉV)
```

#### Tömbben keresés

Indexet ad vissza

```
SearchArray(MIT, MIBEN)
```

#### Tömb mérete

```
SizeOfArray(NÉV)
```

### Struktúrák

```
Struct NÉV
	// VÁLTOZÓK
End_Struct
```

### Osztályok

```
Class NÉV is a cObject // ősosztály
	Procedure Construct_Object // konstruktor
        Forward Send Construct_Object // ősosztály konstruktora
        
        Property TÍPUS NÉV ÉRTÉK // property változók
    End_Procedure
    
    // METÓDUSOK, FÜGGVÉNYEK
End_Class
```

#### Statikus példányosítás

```
Object NÉV is a CLASS
	// PROPERTYK
End_Object

Send METÓDUS of NÉV
```

#### Dinamikus példányosítás

```
Handle NÉV
Get Create(RefClass(OSZÁLY)) to NÉV
Set PROPERTY of NÉV to ÉRTÉK
Send METÓDUS of NÉV
Send Destroy of NÉV // destruktor
```

### Egyéb

#### Mai dátum

```
CurrentDateTime()
```

#### String format

```
SFORMAT("SZÖVEG %1, %2", VÁLTOZÓ1, VÁLTOZÓ2)
```

#### Dátum átadás

```
DateSet(ÉV,HÓNAP,NAP)
```

