include <stdio.h>
include <stdlib.h>

typedef struct _Variable{
	char identifier[];//name
	char type[];//int,char,float
	
} Variable;

typedef struct _Node{
	Variable v;
	No *next;
	No *prev;
} No;

typedef struct _List{
	Node node;
	Node *head;
	Node *tail;

} List;



int main(){

	


	return 0;

}
