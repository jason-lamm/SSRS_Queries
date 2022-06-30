USE [ReportingService_CSP]
GO
SELECT
	c.[Name] AS [Report Name]
	, c.[Path] AS [Report Path]
	, c.CreationDate
	, c.ModifiedDate
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
	, c.CreationDate
	, c.ModifiedDate
ORDER BY 
	c.[Name]
