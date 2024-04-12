IMPLEMENTATION

FUNCTION NumNodos (a:TArbolBin):integer;
VAR
  Hizq, Hder: TArbolBin;
BEGIN
  IF EsArbolBinVacio(a) THEN
    NumNodos:=0;
  ELSE
  BEGIN
    HijoIzquierdo(a,Hizq);
    HijoDerecho(a,Hder);
    NumNodos:=1+NumNodo(Hizq)+NumNodos(Hder);
  END;
end;

FUNCTION NumHojas (a:TArbolBin):integer;
VAR
  Hizq, Hder: TArbolBin;
BEGIN
  IF EsArbolBinVacio(a) THEN
    NumHojas:=0;
  ELSE
  BEGIN
    HijoIzquierdo(a,Hizq);
    HijoDerecho(a,Hder);
    IF EsArbolBinVacio(Hizq) AND EsArbolBinVacio(Hder);
      NumHojas:=1;
    ELSE
      NumHojas:=NumHojas(Hizq)+NumHojas(Hder);
  END;
END;

FUNCTION ArbolesIguales (a1,a2:TArbolBin):boolean;
VAR
  i1,i2,d1,d2:TArbolBin;
  r1,r2:TElemento
BEGIN
  IF EsArbolBinVacio(a1) AND EsArbolBinVacio(a2) THEN
    ArbolesIguales:=TRUE;
  ELSE IF NOT EsArbolBinVacio(a1) AND NOT EsArbolBinVacio(a2) THEN
    BEGIN
      Raiz(a1,r1);
      Raiz(a2, r2);
      IF Iguales (r1, r2) THEN
        BEGIN
          HijoIzquierdo(a1,i1);
          HijoIzquierdo(a2,i2);
          HijoDerecho(a1,d1);
          HijoDerecho(a2,d2);
          ArbolesIguales:=ArbolesIguales(i1,i2) AND ArbolesIguales (d1,d2);
        END;
      ELSE
        ArbolesIguales:=FALSE;
    END;
END;

FUNCTION Pertenece (a:TArbolBin; e:TElemento):boolean;
VAR
  i,d:TArbolBin;
  r:TElemento;
BEGIN
  IF EsArbolBinVacio(a) THEN
    Pertenece:=FALSE;
  ELSE
  BEGIN
    Raiz(a,r);
    IF Iguales(r,e) THEN
      Pertenece:=TRUE;
    ELSE
    BEGIN
      HijoIzquierdo(a, i);
      HijoDerecho(a,d);
      Pertenece:=Pertenece(i,e) OR Pertenece(d,e);
    END;
  END;
END;

PROCEDURE Espejo (a1:TArbolBin; VAR a2:TArbolBin);
VAR
  i,d,i2,d2:TArbolBin;
  r:TElemento;
BEGIN
  IF NOT EsArbolBinVacio(a1) THEN
  BEGIN
     Raiz(a,r);
     HijoIzquierdo(a1,i);
     HijoDerecho(a1,d);
     Espejo(i,i2);
     Espejo(d,d2);
     ConstruirArbolBin(i2,r,d2,a2);
  END;
  ELSE
    CrearArbolBinVacio(a2);
END;

FUNCTION Altura(a:TarbolBin):integer;
VAR
  i,d:TArbolBin;
BEGIN
  IF EsArbolBinVacio(a)THEN
    Altura:=0;
  ELSE
  BEGIN
    HijoIzquierdo(a,i);
    HijoDerecho(a,d);
    Altura:=1+Maximo(Altura(i),Altura(d));
  END
END;

FUNCTION Maximo (a,b:integer):integer;
BEGIN
  IF a>b THEN
    Maximo:=a;
  ELSE
    Maximo:=b;
END;

FUNCTION Compensado (a:TArbolBin):boolean;
VAR
  i,d:TArbolBin;
BEGIN
  IF EsArbolBinVacio(a) THEN
    Compensado:=TRUE;
  ELSE
  BEGIN
    HijoIzquierdo(a,i);
    HijoDerecho(a,d);
    Compensado:=NumNodos(i)=NumNodos(d);
  END;
END;

FUNCTION NivelElemento(e:TElemento; a:TArbolBin):integer;
VAR
  i,d:TArbolBinVacio;
  r:TElemento;
  ni,nd: integer;
BEGIN
  IF EsArbolBinVacio THEN
    NivelElemento:=0;
  ELSE
  BEGIN
    Raiz(a,r);
    IF EsIgual(r,e) THEN
      NivelElemento:=1;
    ELSE
    BEGIN
      HijoIzquierdo(a,i);
      HijoDerecho(a,d);
      ni:=NivelElemento(e,i);
      nd:=NivelElemento(e,d);
      IF (ni>0) AND (nd>0) THEN
        NivelElemento:=1+Minimo(ni, nd);
      ELSE IF (ni=0) AND (nd=0) THEN
        NivelElemento:=0;
      ELSE
        NivelElemento:=1+Maximo(ni,nd);
    END;
  END;
END;

PROCEDURE Preorden (a:TArbolBin; VAR l:TLista);
VAR
  r:TElemento;
  i,d:TArbolBin;
BEGIN
  IF NOT EsArbolBinVacio(a) THEN
  BEGIN
    Raiz(a,r);
    HijoIzquierdo(a,i);
    HijoDerecho(a,d);
    Preorden(d,l);
    Preorden(i,l);
    Construir (r,l);
  END;
END;

PROCEDURE Inorden(a:TArbolBin; VAR l:Tlista);
VAR
  i,d:TArbolBin;
  r:TElemento;
BEGIN
  IF NOT EsArbolBinVacio(a) THEN
  BEGIN
    Raiz(a,r);
    HijoIzquierdo(a,i);
    HijoDerecho(a,d);
    Inorden(d,l);
    Construir(r,l);
    Inorden(i,l);
  END;
END;

PROCEDURE Postorden(a:TArbolBin, VAR l:Tlista);
VAR
  i,d:TArbolBin;
  r:TElemento;
BEGIN
  IF NOT EsArbolBinVacio(a) THEN
  BEGIN
    Raiz(a,r);
    HijoIzquierdo(a,i);
    HijoDerecho(a,d);
    Construir(r,l);
    Postorden(d,l);
    Postorden(i,l);
  END;
END;




