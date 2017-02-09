//
//  Pacco.m
//  8febbraioStoccaggio
//
//  Created by Maurizio on 08/02/17.
//  Copyright © 2017 Maurizio. All rights reserved.
//

#import "Pacco.h"
#import "Utils.h"
@implementation Pacco

-(id)initWithCodice:(NSString *)codice mittente:(NSString *)mittente destinatario:(NSString *) destinatario lunghezza:(NSInteger)lunghezza altezza:(NSInteger)altezza profondita:(NSInteger)profondita andMateriale:(Materiale)materiale {
    //chiamo il costruttore del mio oggetto da cui eredito (in questo caso NSObject)
    self = [super init];
    //controllo se il costruttore padre ha allocato il mio progetto
    if (self) {
        _codice = codice;
        _mittente = mittente;
        _destinatario = destinatario;
        _codice = codice;
        _lunghezza = lunghezza;
        _altezza = altezza;
        _profondita = profondita;
        _materiale = materiale;
        
    }
    //ritorno me stesso allocato o meno
    return self;
}


-(NSInteger) peso {
    NSInteger pesoSpecifico = 0;
    
    switch (_materiale) {
        case MaterialeCarta:
            pesoSpecifico = kPesoSpecificoCarta;
            break;
        case MaterialeFerro:
            pesoSpecifico = kPesoSpecificoFerro;
            break;
        case MaterialePlastica:
            pesoSpecifico = kPesoSpecificoPlastica;
            break;
        default:
            pesoSpecifico = 0;
            break;
    }
    return self.volume * pesoSpecifico;
}

#pragma mark - Getters

-(NSInteger) volume {
    return _lunghezza * _altezza *_profondita;
}
#pragma mark - Override

-(NSString *) description {
    NSString *newDescription = [NSString stringWithFormat:@"%@\n Codice: %@\n Mittente: %@\n Destinatario: %@\n Lunghezza: %li\n Altezza: %li\n Profondità: %li\n Materiale: %li\n Volume: %li cm3\n Peso: %li kg ", [super description], self.codice, self.mittente, self.destinatario, self.lunghezza, self.altezza, (long)self.profondita, (long)self.materiale, self.volume, self.peso/1000];
    
    return newDescription;
}

@end
