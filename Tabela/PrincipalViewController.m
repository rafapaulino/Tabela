//
//  PrincipalViewController.m
//  Tabela
//
//  Created by Rafael Brigagão Paulino on 29/08/12.
//  Copyright (c) 2012 Rafael Brigagão Paulino. All rights reserved.
//

#import "PrincipalViewController.h"

@interface PrincipalViewController ()

@end

@implementation PrincipalViewController

//titulo da secao da tabela
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"Cabecalho secao %d", section];
}
//rodape da secao da tabela
-(NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"Rodape secao %d", section];
}

//chamado toda vez que ha uma selecao em alguma linha (usuario tocou uma linha o metodo e disparado)
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //montando uma caixa de alerta
    UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Celula clicada!" message:@"Voce selecionou uma celula!" delegate:self cancelButtonTitle:@"Fechar" otherButtonTitles: @"Desmarcar celula", nil];
    
    //gurdando a informacao para saber quem devo desmarcar no prox metodo
    _indexCelulaSelecionada = indexPath;
    
    //exibir alerta
    [alerta show];
}

//
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //buttonIndex 0 = cancelButtonTitle
    //os ooutros index sao de acordo com aquilo que vc colocar no array de botoes
   if (buttonIndex == 1)
   {
       //o botao clicado foi o de desmarcar, queremos tirar a selecao da tabela
       
       //qual celular
       [_tabela deselectRowAtIndexPath:_indexCelulaSelecionada animated:YES];
       
   }
}

//metodo chamado toda vez que a tabela precisa montar uma celula
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //criando o identificador da celula da tabel
    NSString *idCelula = @"minhaCelula";
    
    //criacao da celula
    UITableViewCell *celula;
    
    //reciclagem de celulas (verifica se existem celulas fora da tela)
    celula = [_tabela dequeueReusableCellWithIdentifier:idCelula];
    
    if (celula == nil) {
        //allox/init de uma nova celula porque nao hava nenhuma para reciclagem
        celula = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idCelula];
        
        NSLog(@"Estou criando uma nova celula!");
    }
    else
    {
       NSLog(@"Celula reciclada!"); 
    }
    
    //configuracao da celula
    celula.textLabel.text = [NSString stringWithFormat:@"Secao %d - linha %d", indexPath.section, indexPath.row];
    
    return celula;
}

//chamado toda vez que a tabela precisa saber quantas linhas serao exbidas
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return (section * 5 + 5);
}

//quantidade de secoes em minha tabela 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
