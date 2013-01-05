//
//  PrincipalViewController.h
//  Tabela
//
//  Created by Rafael Brigagão Paulino on 29/08/12.
//  Copyright (c) 2012 Rafael Brigagão Paulino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PrincipalViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tabela;
@property (nonatomic, strong) NSIndexPath *indexCelulaSelecionada;

@end
