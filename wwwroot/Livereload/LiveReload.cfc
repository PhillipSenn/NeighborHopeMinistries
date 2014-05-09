component {

remote function Save(BaseName) returnformat="plain" {
	directory action='list' directory='#ExpandPath(".")#' name='myDir' filter="#arguments.BaseName#*.*";
	
	loop query="myDir" {
		local.BaseName = myDir.Name
		for (local.i=Len(myDir.Name); local.i>0; local.i--) {
			if (Mid(myDir.Name,local.i,1) == '.') {
				local.BaseName = Left(myDir.Name,i-1)
				break;
			}
		}
		if (local.BaseName == arguments.BaseName) {
			if (session.LiveReload.DateLastModified < myDir.DateLastModified) {
				session.LiveReload.DateLastModified = myDir.DateLastModified
				return 'Reload'
			}
		}
	}
	return 'No Changes found in #myDir.RecordCount# files.' // myDir
}
}
