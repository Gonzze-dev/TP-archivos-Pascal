unit FUNC_REG_Provincias;

interface

type

    REG_provincia = record
        Nombre_Provincia: String[41];
        Codigo_de_provincia: Byte;
        Telefono_de_contacto: String;
    end;

procedure Inicializar_Registro_Provincia (VAR REG: REG_provincia);
procedure Cargar_Registro_Provincia_y_le_paso_el_nombre_al_registro_persona(VAR Codigo_de_provincia: Byte);
procedure Cargo_Telefono_de_contacto_por_covid(opcion: byte; VAR Telefono_de_contacto: String);
procedure Cargo_Codigo(opcion: Char; VAR COD: Byte);
procedure Cargo_nombre_de_provincia(opcion: Byte; VAR Nombre: String);

procedure Menu_provincias(Var Opcion: Char);

implementation
uses ARCH_REG_Provincia, graph, wincrt;

procedure Inicializar_Registro_Provincia (VAR REG: REG_provincia);
begin

    REG.Nombre_Provincia:= '';
    REG.Codigo_de_provincia:= 0;
    REG.Telefono_de_contacto:= '';

end;

procedure Cargo_Codigo(opcion: Char; VAR COD: Byte);
Var
    Propiedades_Provincia: REG_provincia;
    ARCH_PorpiedadeS_Provincia: ARCHIVO_Provincia;
begin

    CASE Opcion OF
        'A':
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 0);
            COD:= Propiedades_Provincia.Codigo_de_provincia;
        end;
        'B':
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 1);
            COD:= Propiedades_Provincia.Codigo_de_provincia;
        end;
        'D':
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 2);
            COD:= Propiedades_Provincia.Codigo_de_provincia;
        end;
        'E':
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 3);
            COD:= Propiedades_Provincia.Codigo_de_provincia;
        end;
        'F':
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 4);
            COD:= Propiedades_Provincia.Codigo_de_provincia;
        end;
        'G':
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 5);
            COD:= Propiedades_Provincia.Codigo_de_provincia;
        end;
        'H':
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 6);
            COD:= Propiedades_Provincia.Codigo_de_provincia;
        end;
        'J':
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 7);
            COD:= Propiedades_Provincia.Codigo_de_provincia;
        end;
        'K':
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 8);
            COD:= Propiedades_Provincia.Codigo_de_provincia;
        end;
        'L':
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 9);
            COD:= Propiedades_Provincia.Codigo_de_provincia;
        end;
        'M':
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 10);
            COD:= Propiedades_Provincia.Codigo_de_provincia;
        end;
        'N':
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 11);
            COD:= Propiedades_Provincia.Codigo_de_provincia;
        end;
        'P':
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 12);
            COD:= Propiedades_Provincia.Codigo_de_provincia;
        end;
        'Q':
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 13);
            COD:= Propiedades_Provincia.Codigo_de_provincia;
        end;
        'R':
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 14);
            COD:= Propiedades_Provincia.Codigo_de_provincia;
        end;
        'S':
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 15);
            COD:= Propiedades_Provincia.Codigo_de_provincia;
        end;
        'T':
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 16);
            COD:= Propiedades_Provincia.Codigo_de_provincia;
        end;
        'U':
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 17);
            COD:= Propiedades_Provincia.Codigo_de_provincia;
        end;
        'V':
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 18);
            COD:= Propiedades_Provincia.Codigo_de_provincia;
        end;
        'W':
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 19);
            COD:= Propiedades_Provincia.Codigo_de_provincia;
        end;
        'X':
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 20);
            COD:= Propiedades_Provincia.Codigo_de_provincia;
        end;
        'Y':
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 21);
            COD:= Propiedades_Provincia.Codigo_de_provincia;
        end;
        'Z':
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 22);
            COD:= Propiedades_Provincia.Codigo_de_provincia;
        end;
    end;

end;

procedure Cargo_nombre_de_provincia(opcion: Byte; VAR Nombre: String);
Var
    Propiedades_Provincia: REG_provincia;
    ARCH_PorpiedadeS_Provincia: ARCHIVO_Provincia;
begin

    CASE Opcion OF
        1:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 0);
            Nombre:= Propiedades_Provincia.Nombre_Provincia;
        end;
        2:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 1);
            Nombre:= Propiedades_Provincia.Nombre_Provincia;
        end;
        3:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 2);
            Nombre:= Propiedades_Provincia.Nombre_Provincia;
        end;
        4:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 3);
            Nombre:= Propiedades_Provincia.Nombre_Provincia;
        end;
        5:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 4);
            Nombre:= Propiedades_Provincia.Nombre_Provincia;
        end;
        6:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 5);
            Nombre:= Propiedades_Provincia.Nombre_Provincia;
        end;
        7:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 6);
            Nombre:= Propiedades_Provincia.Nombre_Provincia;
        end;
        8:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 7);
            Nombre:= Propiedades_Provincia.Nombre_Provincia;
        end;
        9:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 8);
            Nombre:= Propiedades_Provincia.Nombre_Provincia;
        end;
        10:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 9);
            Nombre:= Propiedades_Provincia.Nombre_Provincia;
        end;
        11:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 10);
            Nombre:= Propiedades_Provincia.Nombre_Provincia;
        end;
        12:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 11);
            Nombre:= Propiedades_Provincia.Nombre_Provincia;
        end;
        13:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 12);
            Nombre:= Propiedades_Provincia.Nombre_Provincia;
        end;
        14:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 13);
            Nombre:= Propiedades_Provincia.Nombre_Provincia;
        end;
        15:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 14);
            Nombre:= Propiedades_Provincia.Nombre_Provincia;
        end;
        16:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 15);
            Nombre:= Propiedades_Provincia.Nombre_Provincia;
        end;
        17:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 16);
            Nombre:= Propiedades_Provincia.Nombre_Provincia;
        end;
        18:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 17);
            Nombre:= Propiedades_Provincia.Nombre_Provincia;
        end;
        19:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 18);
            Nombre:= Propiedades_Provincia.Nombre_Provincia;
        end;
        20:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 19);
            Nombre:= Propiedades_Provincia.Nombre_Provincia;
        end;
        21:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 20);
            Nombre:= Propiedades_Provincia.Nombre_Provincia;
        end;
        22:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 21);
            Nombre:= Propiedades_Provincia.Nombre_Provincia;
        end;
        23:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 22);
            Nombre:= Propiedades_Provincia.Nombre_Provincia;
        end;
    end;

end;

procedure Cargo_Telefono_de_contacto_por_covid(opcion: byte; VAR Telefono_de_contacto: String);
Var
    Propiedades_Provincia: REG_provincia;
    ARCH_PorpiedadeS_Provincia: ARCHIVO_Provincia;
begin

    CASE Opcion OF
        1:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 0);
            Telefono_de_contacto:= Propiedades_Provincia.Telefono_de_contacto;
        end;
        2:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 1);
            Telefono_de_contacto:= Propiedades_Provincia.Telefono_de_contacto;
        end;
        3:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 2);
            Telefono_de_contacto:= Propiedades_Provincia.Telefono_de_contacto;
        end;
        4:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 3);
            Telefono_de_contacto:= Propiedades_Provincia.Telefono_de_contacto;
        end;
        5:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 4);
            Telefono_de_contacto:= Propiedades_Provincia.Telefono_de_contacto;
        end;
        6:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 5);
            Telefono_de_contacto:= Propiedades_Provincia.Telefono_de_contacto;
        end;
        7:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 6);
            Telefono_de_contacto:= Propiedades_Provincia.Telefono_de_contacto;
        end;
        8:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 7);
            Telefono_de_contacto:= Propiedades_Provincia.Telefono_de_contacto;
        end;
        9:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 8);
            Telefono_de_contacto:= Propiedades_Provincia.Telefono_de_contacto;
        end;
        10:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 9);
            Telefono_de_contacto:= Propiedades_Provincia.Telefono_de_contacto;
        end;
        11:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 10);
            Telefono_de_contacto:= Propiedades_Provincia.Telefono_de_contacto;
        end;
        12:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 11);
            Telefono_de_contacto:= Propiedades_Provincia.Telefono_de_contacto;
        end;
        13:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 12);
            Telefono_de_contacto:= Propiedades_Provincia.Telefono_de_contacto;
        end;
        14:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 13);
            Telefono_de_contacto:= Propiedades_Provincia.Telefono_de_contacto;
        end;
        15:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 14);
            Telefono_de_contacto:= Propiedades_Provincia.Telefono_de_contacto;
        end;
        16:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 15);
            Telefono_de_contacto:= Propiedades_Provincia.Telefono_de_contacto;
        end;
        17:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 16);
            Telefono_de_contacto:= Propiedades_Provincia.Telefono_de_contacto;
        end;
        18:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 17);
            Telefono_de_contacto:= Propiedades_Provincia.Telefono_de_contacto;
        end;
        19:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 18);
            Telefono_de_contacto:= Propiedades_Provincia.Telefono_de_contacto;
        end;
        20:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 19);
            Telefono_de_contacto:= Propiedades_Provincia.Telefono_de_contacto;
        end;
        21:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 20);
            Telefono_de_contacto:= Propiedades_Provincia.Telefono_de_contacto;
        end;
        22:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 21);
            Telefono_de_contacto:= Propiedades_Provincia.Telefono_de_contacto;
        end;
        23:
        begin
            Propiedades_Provincia:= tomar_y_devolver_reg_provincia_del_archivo(ARCH_PorpiedadeS_Provincia, Propiedades_Provincia, 22);
            Telefono_de_contacto:= Propiedades_Provincia.Telefono_de_contacto;
        end;
    end;

end;

procedure Menu_provincias(Var Opcion: Char);
begin

    Rectangle((3*16), (16*16), 57*16,(33*16));
    SetFillStyle(SolidFill, 92);
    Bar((3*16)+1, (16*16)+1, 57*16-1,33*16-1);
    SetFillStyle(SolidFill, 91);

    OutTextXY(4*16, 16*17,'[A]-Salta');
    OutTextXY(4*16, 16*18,'[B]-Provincia de Buenos Aires');
    OutTextXY(4*16, 16*19,'[E]-Entre Rios');
    OutTextXY(4*16, 16*20,'[F]-La Rioja');
    OutTextXY(4*16, 16*21,'[G]-Santiago del Estero');
    OutTextXY(4*16, 16*22,'[H]-Chaco');
    OutTextXY(4*16, 16*23,'[K]-Catamarca');
    OutTextXY(4*16, 16*24,'[L]-La Pampa');
    OutTextXY(4*16, 16*25,'[M]-Mendoza');
    OutTextXY(4*16, 16*26,'[N]-Misiones');
    OutTextXY(4*16, 16*27,'[P]-Formosa');
    OutTextXY(4*16, 16*28,'[Q]-Neuquen');
    OutTextXY(4*16, 16*29,'[R]-Rio Negro');
    OutTextXY(4*16, 16*30,'[S]-Santa Fe');
    OutTextXY(4*16, 16*31,'[T]-Tucuman');

    OutTextXY(35*16, 16*17,'[U]-Chubut');
    OutTextXY(35*16, 16*18,'[V]-Tierra del Fuego');
    OutTextXY(35*16, 16*19,'[W]-Corrientes');
    OutTextXY(35*16, 16*20,'[X]-Cordoba');
    OutTextXY(35*16, 16*21,'[Y]-Jujuy');
    
    repeat
        Opcion:= Upcase(readkey);
    until(Opcion in ['A', 'B','D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']);

end;

procedure Cargar_Registro_Provincia_y_le_paso_el_nombre_al_registro_persona(VAR Codigo_de_provincia: Byte);
var
    Opcion: Char;
begin
    Menu_provincias(Opcion);

    Cargo_Codigo(Opcion,Codigo_de_provincia);

end;

end.