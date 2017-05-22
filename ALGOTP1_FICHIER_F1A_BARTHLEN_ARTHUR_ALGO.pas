program FICHIER_VERBE;

uses crt;

const 
	groupe_1 = 'er';
	exeption = 'aller';
	groupe_2 = 'ir';
	pronom = 6; 

procedure creat_verbe (var f:textfile);

begin 
assign (f,'Verbes.txt');
rewrite (f);
close (f);
append(f);
writeln (f,'rire');
writeln (f,'recevoir');
writeln (f,'aller');
writeln (f,'bouillir');
writeln (f,'envoyer');
writeln (f,'peindre');
writeln (f,'habiter');
writeln (f,'payer');
writeln (f,'mourir');
writeln (f,'hair');
writeln (f,'vouloir');
writeln (f,'finir');
readln;

end;

//creation du fichier pour la conjugaison 
procedure crea_fichier2 (var g:textfile);
begin 
assign (g,'conjugaison.txt');
end;
// affichera mon fichier avec tout les verbes 
procedure affichage_Verbes (var f: textfile);
var 
	lines : string; 
begin 
	reset(f);
// tant que mon fichier n'est pas terminé, il lit la ligne du fichier et l'affiche
	while not EOF(f) do 
	begin 
		readln(f,lines);
		writeln(lines);
	end;
close(f);
end;

procedure verif_verb (var f : textfile);
var 
	i : integer;
	lines : string; 
begin
	reset(f);
	while not EOF(f) do 
	begin 
		readln (f,lines);
		// prend 2 lettre avant la fin et vérifie si c'est 'er'
		if (COPY(lines,length(lines)-1,2) = groupe_1) and not (lines = exeption)then 
		writeln(lines,' 1ER groupe')
		// prend 2 lettre avant la fin et vérifie si c'est 'ir'
		else if  (COPY(lines,length(lines)-1,2) = groupe_2) and (lines='hair') or (lines='finir')then
		writeln (lines,' 2 eme groupe')
		else 
		writeln (lines,' 3 eme groupe');
	end;
end;

procedure conjugaison (var f,g : textfile);

var 
	i : integer;
	stock : string; 
	lines : string; 
	radical : string;
begin 
	reset(f);
	while not EOF (f) do 
	begin 
	readln (f,lines);
	for i := 1 to pronom do 
	begin
		// prend tout les caractères avant les terminaisons 
		radical := COPY(lines,1,length(lines)-2);
		if (COPY(lines,length(lines)-1,2) = groupe_1) and not (lines = exeption)then
		begin
			stock := (lines);
			case stock of 
			(COPY(lines 1,1)) = ('h') or ('a') or ('e') or ('i') or ('o') or ('u'): 
			begin 
			writeln (g,' j'''+radical+'e');
			end;
		close (f);
		end;
	end;
			

			

end;




var 
	f : textfile;

	
begin 
	clrscr;
	// apl des procédures 
	creat_verbe(f);
	crea_fichier2(g);
	affichage_Verbes(f);
	verif_verb(f);
	;
	readln;
{ procedure conjugeMaggle(var f : textfile); }
{ var }
	{ i : integer; }
	{ lines : string; }
	{ substr : string; }
	{ c : textfile; }
{ begin }
	{ assign(c, 'conjugaison.txt'); }
	{ rewrite(c); }
	{ reset(c); }
	{ close(c); }
	{ append(c); }
	{ reset(f); }
	
	{ while not EOF(f) do }
	{ begin }
		{ readln(f, lines); }
		{ substr := (COPY(lines,length(lines)-1,2)); }
		{ if ((substr = groupe_1) and not (lines = exeption)) then }
		{ begin }
			{ // Conjuge 1er grp }
			{ write(c, lines); }
			{ writeln(c, ' est un verbe du 1er groupe:'); }
			{ writeln(c, 'Je ' + substr + 'e'); }
			{ writeln(c, 'Tu ' + substr + 'es'); }
		{ end; }
	{ end; }
{ end; }

var 
	f : textfile;	
begin 
	clrscr; 
	creat_verbe(f);
	//affichage_Verbes(f);
	//verif_verb(f);
	//conjugeMaggle(f);
	readln;
	
end.