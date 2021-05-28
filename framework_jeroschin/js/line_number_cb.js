/*The Javascript content to execute. It must have a function called doOperation() which can use the predefined variable "authorAccess".
The "authorAccess" variable has access to the entire Java API "ro.sync.ecss.extensions.api.AuthorAccess".*/
function doOperation(){
     caretOffset = authorAccess.getEditorAccess().getCaretOffset(); 
      currentNode = authorAccess.getDocumentController().getNodeAtOffset(caretOffset); 
      //Move caret after current node 
      authorAccess.getEditorAccess().setCaretPosition(currentNode.getEndOffset() + 1); 
}