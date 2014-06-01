var allElems = document.getElementsByTagName('input');
// for (i = 0; i < allElems.length; i++) {
//     if (allElems[i].type == 'radio' && allElems[i].value == 'clean') {
//         allElems[i].checked = true;
//     }
// }
if ((allElems[3].type == 'text' || allElems[4].type == 'text') && ('' != allElems[3].value || '' != allElems[4].value)) {
	allElems[2].checked = true;
};