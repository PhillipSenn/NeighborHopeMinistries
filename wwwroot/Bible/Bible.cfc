component {

function EntireBible(arg) {
	include "/Inc/newQuery.cfm";
	// TODO: remove BookName
	local.sql = "
	DECLARE @VersionSort Int = #Val(arg.VersionSort)#
	SELECT TOP 10 VerseID,BookName
	,NASB.Chapter
	,NASB.VerseSort
	,NASB.VerseName AS NASBVerse
	,KJVVerse
	FROM VerseView NASB
	JOIN (
		SELECT BookSort,Chapter,VerseSort
		,VerseName AS KJVVerse
		FROM VerseView
		WHERE VersionSort=1
	) KJV
	ON  NASB.BookSort  = KJV.BookSort
	AND NASB.Chapter   = KJV.Chapter
	AND NASB.VerseSort = KJV.VerseSort
	WHERE VersionSort = 2
	ORDER BY NASB.BookSort,NASB.VerseSort
	";
	include "/Inc/execute.cfm";
	return local.result
}

remote function Save(VerseID) returnformat="plain" {
	include "/Inc/newQuery.cfm";
	local.sql = "
	DECLARE @SpoudazoID Int = 0
	DECLARE @PersonID Int = #Val(session.Person.qry.PersonID)#
	DECLARE @VerseID Int = #Val(arguments.VerseID)#
	SELECT @SpoudazoID = SpoudazoID
	FROM Spoudazo
	WHERE Spoudazo_PersonID = @PersonID
	AND Spoudazo_VerseID = @VerseID
	IF @SpoudazoID = 0 BEGIN
		INSERT INTO Spoudazo(Spoudazo_PersonID,Spoudazo_VerseID) VALUES(@PersonID,@VerseID)
	END ELSE BEGIN
		UPDATE Spoudazo SET
		SpoudazoSort = SpoudazoSort + 1
		WHERE SpoudazoID = @SpoudazoID
	END
	";
	include "/Inc/execute.cfm";

	include "/Inc/newQuery.cfm";
	local.sql = "
	DECLARE @PersonID Int = #Val(session.Person.qry.PersonID)#
	DECLARE @VerseID Int = #Val(arguments.VerseID)#
	SELECT *
	FROM Spoudazo
	WHERE Spoudazo_PersonID = @PersonID
	AND Spoudazo_VerseID = @VerseID
	";
	include "/Inc/execute.cfm";
	local.result = local.result.qry.SpoudazoSort
	return local.result
}
}
