#include <UIKit/UIKit.h>

#define UNREAD_PATH @"/Library/Application Support/MessageUnread/unread.txt"

@interface IMChat : NSObject
@property (nonatomic, readonly) NSString *chatIdentifier;
@property (nonatomic, readonly) NSString *guid;
- (id)chatItems;
@end

@interface CKConversation : NSObject
- (id)name;
- (IMChat *)chat;
- (void)markAllMessagesAsRead;
- (BOOL)hasUnreadMessages;
@end

@interface CKNavigationController : UINavigationController
@end

@interface CKConversationListController : UITableViewController<UITableViewDelegate, UITableViewDataSource>
- (void)viewWillAppear:(BOOL)arg1;
- (id)conversationList;
-(void)updateConversationList;
-(void)test;
@end

@interface CKConversationListCell : UITableViewCell
- (CKConversation *)conversation;
- (void)layoutSubviews;
- (void)updateContentsForConversation:(id)arg1;
@end

@interface CKConversationList : NSObject
- (id)conversations;
@end

//PREFERENCES

static BOOL enabled = TRUE;
static BOOL messageMarking = TRUE;
static NSString *unreadImageColor;

//DECLARATIONS

NSArray *unreadArray;
UITableView *table;

//IMPLEMENTATION

%hook CKConversationListController

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath { // Aqui da lugar a que cuando le das a una conversacion se marca como que no esta leido.
    // De normal no haria falta tirar de esta funcion, pero este tweak marca los no leidos (marcados manualmente) en otra lista, por lo que siempre se pasa.
    CKConversationListCell *cell = (CKConversationListCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    CKConversation *convo = [cell conversation]; // identificador de la conversacion.

    [convo markAllMessagesAsRead]; // marca la conversacion como que ya se ah leido.

    NSString *identifier = [convo chat].chatIdentifier; // identificador del mensaje.

    NSArray *unreadList = [NSArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"unread"]];
    NSMutableArray *unreadListMutable = [unreadList mutableCopy]; // carga la lista

    for(NSString *string in unreadList){
        if([string isEqual:@""]){ // Aqui quita los valores null de la lsita.
            [unreadListMutable removeObject: string];
        }
        if([string isEqual: identifier]){ // si el identificador de la conversacion se encuentra en la lista, se quita.
            [unreadListMutable removeObject: string];
            [[NSUserDefaults standardUserDefaults] setObject:unreadListMutable forKey:@"unread"];
        }
    }
    %orig; // Si es un mensaje no leido que no esta en la lista del tweak se quitara de modo normal.
}

%new
-(UISwipeActionsConfiguration *)tableView:(UITableView *)tableView leadingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath {
  UIContextualAction *unread = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive title:@"Unread" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
    //UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
      if(enabled && messageMarking){

        CKConversationListCell *cell = (CKConversationListCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
        CKConversation *convo = [cell conversation]; // identificador de la conversacion.
        BOOL reallyHadUnread = NO;

        if([convo hasUnreadMessages]){ //Aqui comprueba si la conversacion tiene mensajes no leidos, si es asi, marca los mensajes como leidos al deslizar hacia la derecha.
            [convo markAllMessagesAsRead];
            reallyHadUnread = YES; // Aqui indica que de verdad ha desmarcado los mensajes como leidos, luego mas adelante (linea 343) comprueba que de verdad los ha desmarcado, por lo que no hay que añadirle a la lista de no leidos.
            [self test];
        }

        IMChat *chat = [convo chat];  // Identifica la conversacion.
        NSString *identifier = chat.chatIdentifier;

        BOOL adding = YES; // Marca como añadir, para luego comprobar si hay que añadir la conversacion a la lista de no leidos.
        NSArray *unreadList = [NSArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"unread"]];
        NSMutableArray *unreadListMutable = [unreadList mutableCopy]; // carga la lista
        for(NSString *string in unreadList){
            if([string isEqual:@""]){
                [unreadListMutable removeObject: string];
            }
            if([string isEqual: identifier]){ // Como el identificador de la conversacion no esta en el array de no leidos, no se ejecuta esta parte. 
                // Si el identificador esta en el array de no leidos, se ejecuta esta parte, quitandolo de la lista de no leidos.
                [unreadListMutable removeObject: string];
                [[NSUserDefaults standardUserDefaults] setObject:unreadListMutable forKey:@"unread"];
                adding = NO;
                [self test];
            }
        }
        if(adding && !reallyHadUnread){ //Esto solo se ejecuta si ha marcado mensajes como leidos, si no es asi no se ejecuta
            [unreadListMutable addObject: identifier];
            [[NSUserDefaults standardUserDefaults] setObject:unreadListMutable forKey:@"unread"]; // Añadir conversacion a la lista de no leidos.
            [self test];
        }
        //[table reloadData];
        //[self updateConversationList]; // Recargar la lista
        completionHandler(true);
    }
  }];
  unread.backgroundColor = [UIColor  grayColor];
  UISwipeActionsConfiguration *swipeActionConfig = [UISwipeActionsConfiguration configurationWithActions:@[unread]];
  swipeActionConfig.performsFirstActionWithFullSwipe = YES;
  [self updateConversationList]; // Recargar la lista, no funciona muy bien.
  return swipeActionConfig;
}

%new
-(void)test {
  [self updateConversationList];
}

%end

%hook CKConversation

- (BOOL)hasUnreadMessages {

    unreadArray = [NSArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"unread"]];
    NSMutableArray *tempArray = [unreadArray mutableCopy];

    for(NSString *string in unreadArray){ // limpia la lista de no leidos de lineas null
        if([string isEqual: @""]){
            [tempArray removeObject: string];
        }
    }

    BOOL isOnList = NO; // Marca siempre como que no esta en la lista para despues descarmarlo si hace falta.....
    unreadArray = [[NSArray alloc] initWithArray: tempArray]; // cargar la lista de no leidos

    IMChat *chat = [self chat];
    NSString *identifier = chat.chatIdentifier; // Cargar identificador de mensaje.

    for(id unread in unreadArray){
        if([identifier isEqual: unread]){ // Comprobar si el identificador de la conversacion esta en la lista, si lo esta, lo marca como que si.
            isOnList = YES;
        }
    }

    if(isOnList && messageMarking){
        return YES; // Si el identificador esta en la lista, el BOOL devuelve el valor que si que tiene mensajes no leidos.
    }else {
        return %orig; // Si el identificador no esta en la lista, devuelve el valor original
    }

}

%end

%ctor {
  NSArray *unreadList = [NSArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"unread"]];
  if ([[NSString stringWithFormat:@"%@", unreadList] isEqualToString:@"(null)"]) {
      [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"unread"];
    }
}