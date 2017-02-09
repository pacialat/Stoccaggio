//
//  ViewController.m
//  8febbraioStoccaggio
//
//  Created by Maurizio on 08/02/17.
//  Copyright © 2017 Maurizio. All rights reserved.
//

#import "ViewController.h"

#import "Pacco.h"
#import "Corriere.h"
@interface ViewController ()

@end

NSInteger volumeTotalePacchi;
NSInteger pesoTotalePacchi;
Corriere *corriere;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Pacco *pacco = [[Pacco alloc]initWithCodice:@"0000001" mittente:@"Matteo" destinatario:@"Maurizio" lunghezza:100 altezza:100 profondita:100 andMateriale:MaterialePlastica];
    NSLog(@"Info del pacco %@",pacco);
    
    [self generaPacchi];
    //volume del corriere
    NSInteger volumeRandom = (NSInteger)[self getRandomNumberBetween:100000000 to:999999999];
    //carico massimo del corriere
    NSInteger caricoRandom = (NSInteger)[self getRandomNumberBetween:1000000 to:5000000];
    corriere = [[Corriere alloc]initWithVolume:volumeRandom carico:caricoRandom];
    NSLog(@"Info del corriere %@",corriere);
    
    [self contaVolumePesoPacchi];
}

-(void) contaVolumePesoPacchi {
    NSLog(@"Volume totale pacchi %li cm3",(long)volumeTotalePacchi);
    NSLog(@"Peso totale pacchi %li kg", (long)pesoTotalePacchi / 1000);
    NSInteger corrieriRichiestiVolume = volumeTotalePacchi / corriere.volume;
    NSInteger corrieriRichiestiPeso = pesoTotalePacchi / corriere.carico;
    
    float corriereParzialmenteVuoto;
    float percentualeOccupazioneCorriere;
    if (corrieriRichiestiPeso > corrieriRichiestiVolume) {
        corriereParzialmenteVuoto = (float)pesoTotalePacchi / (float)corriere.carico;
        percentualeOccupazioneCorriere = (corriereParzialmenteVuoto - corrieriRichiestiPeso) * 100;
    } else {
         corriereParzialmenteVuoto= (float)volumeTotalePacchi / (float)corriere.volume;
         percentualeOccupazioneCorriere = (corriereParzialmenteVuoto - corrieriRichiestiVolume) * 100;
    }
    
    
    if (corrieriRichiestiPeso > corrieriRichiestiVolume) {
        NSLog(@"Corrieri richiesti a causa del peso %li", (long)corrieriRichiestiPeso+1);
    } else {
        NSLog(@"Corrieri richiesti a causa del volume %li", (long)corrieriRichiestiVolume+1);
    }
    
    NSLog(@"di cui 1 corriere parzialmente vuoto, riempito al %.2f%%",percentualeOccupazioneCorriere);
    

}
-(int)getRandomNumberBetween:(int)from to:(int)to {
    return (int)from + arc4random() % (to-from+1);
}
-(void) generaPacchi {
    for (int i = 0; i <100; i++) {
        NSString *codiceRandom = [NSString stringWithFormat: @"%i", [self getRandomNumberBetween:111111 to:999999]];
        NSInteger lunghezzaRandom = [self getRandomNumberBetween:10 to:50];
        NSInteger altezzaRandom = [self getRandomNumberBetween:10 to:50];
        NSInteger profonditaRandom = [self getRandomNumberBetween:10 to:50];
        NSInteger materialeRandom = [self getRandomNumberBetween:1 to:3];
        Pacco *pacco = [[Pacco alloc] initWithCodice:codiceRandom mittente:@"Daniele" destinatario:@"Maurizio" lunghezza:lunghezzaRandom altezza:altezzaRandom profondita:profonditaRandom andMateriale:materialeRandom];
        NSLog(@"Info del pacco %i %@",i+1,pacco);
        volumeTotalePacchi += pacco.volume;
        pesoTotalePacchi += pacco.peso;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
