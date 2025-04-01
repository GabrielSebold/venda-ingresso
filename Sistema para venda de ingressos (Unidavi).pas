{Alunos: Gabriel Sebold e Leonardo Casa Nova}

Program controle_ingressos ;

const tam_fila_socio = 200;
			tam_fila_normal = 2150;
			tam_fila_vis = 350;
			tam_pilha_arqui = 1500;
      tam_pilha_geral = 850;
      tam_pilha_vis = 350;
type
fila_socio = array[1..tam_fila_socio] of string;
fila_normal = array[1..tam_fila_normal] of string;
fila_vis = array[1..tam_fila_vis] of string;
pilha_arqui = array[1..tam_pilha_arqui] of integer;
pilha_geral = array[1..tam_pilha_geral] of integer;
pilha_vis = array[1..tam_pilha_vis] of integer;

var socios:fila_socio;
		normal:fila_normal;
		visitante:fila_vis;
		ing_arqui: pilha_arqui;
		ing_geral: pilha_geral;
		ing_vis: pilha_vis;
		lug_arqui: pilha_arqui;
		lug_geral: pilha_geral;
		lug_vis: pilha_vis;
		nome: string;
		continua: boolean;
op,qtd_ing,qtd_socios,qtd_normal,qtd_vis,qtd_arqui,qtd_geral,qtd_ing_vis, qtd_lugarArqui, qtd_lugarGeral, qtd_lugarVis, lugar, i:integer;

{------------------------------------------------------------------------------}
{--------------------Ínicio das Procedures de Inicialização--------------------}
{------------------------------------------------------------------------------}


procedure inicializaIngressos(var ing_arqui: pilha_arqui; var ing_geral:pilha_geral ; var ing_vis:pilha_vis ; tam_arqui: integer; tam_geral:integer; tam_vis:integer);
var  i:integer;
begin
  for i:=1 to tam_arqui do
  	ing_arqui[i]:= 1;
  	
  for i:=1 to tam_geral do
  	ing_geral[i]:= 1;
  	
  for i:=1 to tam_vis do
  	ing_vis[i]:= 1;	
end;

procedure inicializaLugares(var lug_arqui: pilha_arqui; var lug_geral:pilha_geral ; var lug_vis:pilha_vis ; tam_arqui: integer; tam_geral:integer; tam_vis:integer);
var  i:integer;
begin
  for i:=1 to tam_arqui do
  	lug_arqui[i]:= i;
  	
  for i:=1 to tam_geral do
  	lug_geral[i]:= i;
  	
  for i:=1 to tam_vis do
  	lug_vis[i]:= i;	
end;

procedure inicializa(var pos:integer);
begin
  pos:=0;
end;

{------------------------------------------------------------------------------}
{--------------------Fim das Procedures de Inicialização-----------------------}
{------------------------------------------------------------------------------}


{---------------------------------------------------------------------------}
{--------------------Ínicio das Funções de Cheia e Vazia--------------------}
{---------------------------------------------------------------------------}

function cheia(posicao:integer; tam:integer):boolean;

begin
  cheia:=true;
  if posicao<tam then
  cheia:=false;
end;

function vazia(posicao:integer):boolean;

begin
  vazia:=false;
  if posicao <= 0 then
  vazia:=true;
end;


{---------------------------------------------------------------------------}
{-----------------------Fim das Funções de Cheia e Vazia--------------------}
{---------------------------------------------------------------------------}



{--------------------------------------------------------------------}
{--------------------Ínicio da Escolha de Lugares--------------------}
{--------------------------------------------------------------------}



function escolheLugarArqui(lugares: pilha_arqui; tam: integer): integer;
var
  lugar, i: integer;
  valido: boolean;
begin
  repeat
    writeln('    Escolha um lugar    ');
    writeln('------------');
    writeln;
    for i := 1 to tam do
      write('| ', lugares[i], ' |');
    writeln;
    write('    ==> ');
    readln(lugar);
    
    valido := false;
    for i := 1 to tam do
      if lugares[i] = lugar then
      begin
        valido := true;
        break;
      end;
      
    if not valido then
      writeln('Lugar inválido ou já escolhido. Tente novamente.');
      
  until valido;
  
  escolheLugarArqui := lugar;
end;

function escolheLugarGeral(lugares: pilha_geral; tam: integer): integer;
var
  lugar, i: integer;
  valido: boolean;
begin
  repeat
    writeln('    Escolha um lugar    ');
    writeln('------------');
    writeln;
    for i := 1 to tam do
      write('| ', lugares[i], ' |');
    writeln;
    write('    ==> ');
    readln(lugar);
    
    valido := false;
    for i := 1 to tam do
      if lugares[i] = lugar then
      begin
        valido := true;
        break;
      end;
      
    if not valido then
      writeln('Lugar inválido ou já escolhido. Tente novamente.');
      
  until valido;
  
  escolheLugarGeral := lugar;
end;

function escolheLugarVisitante(lugares: pilha_vis; tam: integer): integer;
var
  lugar, i: integer;
  valido: boolean;
begin
  repeat
    writeln('    Escolha um lugar    ');
    writeln('------------');
    writeln;
    for i := 1 to tam do
      write('| ', lugares[i], ' |');
    writeln;
    write('    ==> ');
    readln(lugar);
    
    valido := false;
    for i := 1 to tam do
      if lugares[i] = lugar then
      begin
        valido := true;
        break;
      end;
      
    if not valido then
      writeln('Lugar inválido ou já escolhido. Tente novamente.');
      
  until valido;
  
  escolheLugarVisitante := lugar;
end;



{-----------------------------------------------------------------}
{--------------------Fim da Escolha de Lugares--------------------}
{-----------------------------------------------------------------}





{----------------------------------------------------------------------}
{--------------------Ínicio das Remoções de Pilhas---------------------}
{----------------------------------------------------------------------}


procedure removeLugarArqui(var vetor:pilha_arqui; var p,el:integer);
	var inicio,meio,fim, j:integer;
begin
    fim := p;
    inicio := 1; 
    meio:= (inicio+fim) div 2;
    while (vetor[meio] <> el) and (inicio<fim) do
    begin
       if (el = vetor[meio]) then 
          meio := meio
       else if (el < vetor[meio]) then 
          fim:=(meio-1)
       else if (el > vetor[meio]) then
          inicio:=(meio+1);
       meio := (inicio+fim) div 2;
    end;

    	 for j:= meio to p-1 do
	       vetor[j]:=vetor[j+1];
	       
       p:=p-1; 
end;

procedure removeLugarGeral(var vetor:pilha_geral; var p,el:integer);
	var inicio,meio,fim, j:integer;
begin
    fim := p;
    inicio := 1; 
    meio:= (inicio+fim) div 2;
    while (vetor[meio] <> el) and (inicio<fim) do
    begin
       if (el = vetor[meio]) then 
          meio := meio
       else if (el < vetor[meio]) then 
          fim:=(meio-1)
       else if (el > vetor[meio]) then
          inicio:=(meio+1);
       meio := (inicio+fim) div 2;
    end;

    	 for j:= meio to p-1 do
	       vetor[j]:=vetor[j+1];
	       
       p:=p-1; 
end;

procedure removeLugarVisitante(var vetor:pilha_vis; var p,el:integer);
	var inicio,meio,fim, j:integer;
begin
    fim := p;
    inicio := 1; 
    meio:= (inicio+fim) div 2;
    while (vetor[meio] <> el) and (inicio<fim) do
    begin
       if (el = vetor[meio]) then 
          meio := meio
       else if (el < vetor[meio]) then 
          fim:=(meio-1)
       else if (el > vetor[meio]) then
          inicio:=(meio+1);
       meio := (inicio+fim) div 2;
    end;

    	 for j:= meio to p-1 do
	       vetor[j]:=vetor[j+1];
	       
       p:=p-1; 
end;


{----------------------------------------------------------------------}
{---------------------Fim das Remoções de Pilhas-----------------------}
{----------------------------------------------------------------------}



{--------------------------------------------------------------------------------------}
{--------------------Ínicio das solicitações de compra de Ingressos--------------------}
{--------------------------------------------------------------------------------------}

procedure defineQtd(var qtd_ing:integer);
begin
writeln ('    Quantos ingressos deseja?    ');
  writeln ('------------');
  writeln;
  write('    ==> ');
  readln (qtd_ing);
end;

procedure compraSocio(var socios:fila_socio; var qtd_socios: integer; var ing_arqui:pilha_arqui; var qtd_arqui:integer; nome:string; var lugares:pilha_arqui; lugar:integer; var qtd_lugar:integer);
var i:integer;
begin
		qtd_socios:= qtd_socios + 1;
		
    socios[qtd_socios]:=nome;	
		
    ing_arqui[qtd_arqui]:= 0;
		qtd_arqui := qtd_arqui - 1;
		
		removeLugarArqui(lugares, qtd_lugar, lugar);
		
		writeln('Compra efetuada com sucesso. Tenha um bom jogo.');
end;

procedure compraArqui(var normal:fila_normal; var qtd_normal: integer; var ing_arqui:pilha_arqui; var qtd_arqui:integer; nome:string; var lugares:pilha_arqui; lugar:integer; var qtd_lugar:integer);
var i:integer;
begin
		qtd_normal:= qtd_normal + 1;
    normal[qtd_normal]:=(nome);	    	
		
    ing_arqui[qtd_arqui]:= 0;
		qtd_arqui := qtd_arqui - 1;
		
		removeLugarArqui(lugares, qtd_lugar, lugar);
		
		writeln('Compra efetuada com sucesso. Tenha um bom jogo.');
end;

procedure compraGeral(var normal:fila_normal; var qtd_normal: integer; var ing_geral:pilha_geral; var qtd_geral:integer; nome:string; var lugares:pilha_geral; lugar:integer; var qtd_lugar:integer);
var i:integer;
begin
		qtd_normal:= qtd_normal + 1;
    normal[qtd_normal]:=(nome);	
		
    ing_geral[qtd_geral]:= 0;
		qtd_geral := qtd_geral - 1;
		
		removeLugarGeral(lugares, qtd_lugar, lugar);
		
		writeln('Compra efetuada com sucesso. Tenha um bom jogo.');
end;

procedure compraVisitante(var visitante:fila_vis; var qtd_vis: integer; var ing_vis:pilha_vis; var qtd_ing_vis:integer; nome:string; var lugares:pilha_vis; lugar:integer; var qtd_lugar:integer);
var i:integer;
begin
		qtd_vis:= qtd_vis + 1;
    visitante[qtd_vis]:=(nome);		
		
    ing_vis[qtd_ing_vis]:= 0;
		qtd_ing_vis := qtd_ing_vis - 1;
		
		removeLugarVisitante(lugares, qtd_lugar, lugar);
		
		writeln('Compra efetuada com sucesso. Tenha um bom jogo.');
end;


{--------------------------------------------------------------------------------------}
{--------------------Fim das solicitações de compra de Ingressos-----------------------}
{--------------------------------------------------------------------------------------}



{-------------------------------------------------------------------------------}
{--------------------Ínicio dos Menus de compra de Ingressos--------------------}
{-------------------------------------------------------------------------------}


procedure menuSocio (var op_socio:integer);
begin
	  writeln ('    Opções  ');
	  writeln ('------------');
	  writeln;
	  writeln (' 1-Arquibancada - R$70,00');
	  writeln (' 2-Sair');
	  writeln;
	  write('    ==> ');
	  readln (op_socio);
		clrscr;
end;

procedure menuNormal (var op_normal:integer);
begin
	  writeln ('    Opções  ');
	  writeln ('------------');
	  writeln;
	  writeln (' 1-Arquibancada - R$150,00');
	  writeln (' 2-Geral - R$50,00');
	  writeln (' 3-Sair');
	  writeln;
	  write('    ==> ');
	  readln (op_normal);
		clrscr;
end;

procedure menuVisitante (var op_visitante:integer);
begin
	  writeln ('    Opções  ');
	  writeln ('------------');
	  writeln;
	  writeln (' 1-Visitante - R$100,00');
	  writeln (' 2-Sair');
	  writeln;
	  write('    ==> ');
	  readln (op_visitante);
		clrscr;
end;

procedure menuContinuar(var op_menu:integer);
begin
	writeln;
  writeln ('    Deseja voltar para o início?    ');
  writeln ('------------');
  writeln;
  writeln (' 1-Sim');
  writeln (' 2-Não');
  writeln;
  write('    ==> ');
  readln (op_menu);
  clrscr; 	
end;

procedure menu(var op_menu:integer);
begin
  clrscr;
  writeln ('    Selecione uma opção?    ');
  writeln ('------------');
  writeln;
  writeln (' 1-Sócio Torcedor');
  writeln (' 2-Torcedor Santa Catarina');
  writeln (' 3-Visitante');
  writeln (' 4-Sair');
  writeln;
  write('    ==> ');
  readln (op_menu);
  clrscr; 	
end;


{-------------------------------------------------------------------------------}
{--------------------Fim dos Menus de compra de Ingressos-----------------------}
{-------------------------------------------------------------------------------}


{------------------------------------------------------------------------------}
{--------------------Ínicio das Procedures de Apresentação---------------------}
{------------------------------------------------------------------------------}

procedure apresentaTotais(qtd_socios:integer; qtd_arqui:integer; qtd_geral:integer; qtd_ing_vis:integer; tam_pilha_arqui:integer; tam_pilha_geral:integer; tam_pilha_vis:integer);
var rendaTotal:integer;
begin
	 rendaTotal:= 0;
	 writeln('Renda sócios: ', qtd_socios * 70);
	 writeln;
	 rendaTotal:= rendaTotal + (qtd_socios * 70);
	 writeln('Renda Arquibancada (sem sócios): ', (tam_pilha_arqui - qtd_arqui - qtd_socios) * 150);
	 writeln;
	 rendaTotal:= rendaTotal + ((tam_pilha_arqui - qtd_arqui - qtd_socios) * 150);
	 writeln('Renda geral: ', (tam_pilha_geral - qtd_geral) * 50);
	 writeln;
	 rendaTotal:= rendaTotal + ((tam_pilha_geral - qtd_geral) * 50);
	 writeln('Renda visitante: ', (tam_pilha_vis - qtd_ing_vis) * 100);
	 writeln;
	 rendaTotal:= rendaTotal + ((tam_pilha_vis - qtd_ing_vis) * 100);
	 
	 writeln('Renda total: ', rendaTotal);
end;

procedure apresentaCompradores(socios:fila_socio; qtd_socios:integer; normal:fila_normal; qtd_normal:integer; visitantes:fila_vis; qtd_vis:integer);
var i:integer;
begin
		writeln('Sócios:');
		for i:= 1 to qtd_socios do
			writeln(socios[i]);	
			
		writeln('Normal:');
		for i:= 1 to qtd_normal do
			writeln(normal[i]); 
			
		writeln('Visitante:');
		for i:= 1 to qtd_vis do
			writeln(visitantes[i]); 
end;


{------------------------------------------------------------------------------}
{--------------------Fim das Procedures de Apresentação------------------------}
{------------------------------------------------------------------------------}


{Programa Principal}

begin
	inicializa(op);
	inicializa(qtd_socios);
	inicializa(qtd_normal);
	inicializa(qtd_vis);
	inicializa(qtd_ing);
	inicializaIngressos(ing_arqui, ing_geral, ing_vis, tam_pilha_arqui, tam_pilha_geral, tam_pilha_vis);
	inicializaLugares(lug_arqui, lug_geral, lug_vis, tam_pilha_arqui, tam_pilha_geral, tam_pilha_vis);
	qtd_arqui := tam_pilha_arqui;
	qtd_geral := tam_pilha_geral;
	qtd_ing_vis := tam_pilha_vis;
	qtd_lugarArqui:= tam_pilha_arqui;
	qtd_lugarGeral:= tam_pilha_geral;
	qtd_lugarVis:= tam_pilha_vis;
	continua:= true;

	while(continua) do
	begin
		write('Digite seu nome: ');	
		readln(nome);
		
		menu(op);
		if(op = 1) then
			begin
			if NOT (cheia(qtd_socios, tam_fila_socio)) then
				begin
					menuSocio(op);
					if op = 1 then
					begin
					defineQtd(qtd_ing);
					if NOT (cheia(qtd_socios + qtd_ing, tam_fila_socio + 1)) then
						begin
						for i:= 1 to qtd_ing do
						begin
						lugar:= escolheLugarArqui(lug_arqui, qtd_lugarArqui);
						compraSocio(socios, qtd_socios, ing_arqui, qtd_arqui, nome, lug_arqui, lugar, qtd_lugarArqui);
						end;
						end
					else
						begin 
						clrscr;
						writeln('Não há essa quantidade de ingressos disponíveis para sócios');
						end;
					end;
				end
			else 
				begin 
				clrscr;
				writeln('Não há mais ingressos disponíveis para sócio');
				end;
			end
		else if (op = 2) then
		begin
		 	if NOT (cheia(qtd_normal, tam_fila_normal)) then
				begin
					menuNormal(op);
					if op = 1 then
					begin
					defineQtd(qtd_ing);
					if NOT (cheia(qtd_normal + qtd_ing, tam_fila_normal + 1) AND vazia(qtd_arqui - tam_fila_socio - qtd_ing)) then
						begin
						for i:= 1 to qtd_ing do
						begin
						lugar:= escolheLugarArqui(lug_arqui, qtd_lugarArqui);
						compraArqui(normal, qtd_normal, ing_arqui, qtd_arqui, nome, lug_arqui, lugar, qtd_lugarArqui);
						end;
						end
					else
						begin 
						clrscr; 
						writeln('Não há mais ingressos disponíveis para arquibancada');
						end;
					end                                                              
					else if (op = 2) then 
						begin
						defineQtd(qtd_ing);
						if NOT (cheia(qtd_normal + qtd_ing, tam_fila_normal + 1) AND vazia(qtd_geral - qtd_ing)) then
							begin
							for i:= 1 to qtd_ing do
							begin
							lugar:= escolheLugarGeral(lug_geral, qtd_lugarGeral);
							compraGeral(normal, qtd_normal, ing_geral, qtd_geral, nome, lug_geral, lugar, qtd_lugarGeral);
							end;
							end
						else
							begin 
							clrscr; 
							writeln('Não há mais ingressos disponíveis para geral');
							end;
						end;
				end
			else 
				writeln('Ingressos esgotados!');
			end
		else if (op = 3) then
			begin
			if NOT (cheia(qtd_vis, tam_fila_vis + 1) AND vazia(qtd_ing_vis)) then
				begin
					menuVisitante(op);
					if op = 1 then
					begin
					defineQtd(qtd_ing);
					if NOT (cheia(qtd_vis + qtd_ing, tam_fila_vis + 1)) then
						begin
						for i:= 1 to qtd_ing do
						begin
						lugar:= escolheLugarVisitante(lug_vis, qtd_lugarVis);
						compraVisitante(visitante, qtd_vis, ing_vis, qtd_ing_vis, nome, lug_vis, lugar, qtd_lugarVis);
						end;
						end
					else 
						writeln('Não há essa quantidade de ingressos disponíveis para visitante');
					end;
				end
			else 
				writeln('Não há mais ingressos disponíveis para visitante');
			end
	  else if (op = 4) then
	  begin
	   	continua:= false;
	  end;
	  
	  menuContinuar(op);
	  if op = 2 then
	  	continua:= false;
	 end;
	 
	 apresentaTotais(qtd_socios, qtd_arqui, qtd_geral, qtd_ing_vis, tam_pilha_arqui, tam_pilha_geral, tam_pilha_vis);
	 writeln;
	 apresentaCompradores(socios, qtd_socios, normal, qtd_normal, visitante, qtd_vis);
end.