USE [ReportServer]
GO
SELECT
	c.[Name] AS [Report Name]
	, c.[Path] AS [Report Path]
	, ISNULL(CAST(MAX(CONVERT(VARCHAR(25), e.[TimeStart], 121)) AS VARCHAR), '') AS [Last Execution]
FROM 
	[Catalog] c
LEFT JOIN [ExecutionLog] e
	ON e.[ReportID] = c.[ItemID]
WHERE 
	c.Type = 2
GROUP BY
	c.[Name]
	, c.[Path]
ORDER BY 
	c.[Name]
