
        IF OBJECT_ID('tempdb..#tmpTable') IS NOT NULL
            DROP TABLE #tmpTable;
		IF OBJECT_ID('tempdb..#tmpKQ') IS NOT NULL
            DROP TABLE #tmpKQ;

        SELECT  Rs.RootPersonId id ,
                Rs.Name name ,
                Rs.FatherRootPersonId pid ,
                Rs.ImageLink img ,
                '' tags ,
                Rs.PartnerPersonId ,
                Rs.RootBranchId ,
                Rs.Level ,
                Rs.Sex ,
                Rs.Phone
        INTO    #tmpTable
        FROM    ( SELECT    RP.RootPersonId ,
                            RP.Level ,
                            RP.Name ,
                            RP.FatherRootPersonId ,
                            RP.MotherRootPersonId ,
                            ISNULL(Father.Name, '') FatherName ,
                            ISNULL(Mother.Name, '') MotherName ,
                            Father.SortOrder FS ,
                            FORMAT(RP.DateOfBirth, 'dd/MM/yyyy') DateOfBirth ,
                            CASE WHEN RP.Sex = 1 THEN N'Nam'
                                 ELSE N'Nữ'
                            END Sex ,
                            ISNULL(RP.Address, '') Address ,
                            ISNULL(RP.Phone, '') Phone ,
                            RP.SortOrder ,
                            RP.RootBranchId ,
                            RM.PartnerPersonId ,
                            RM.WeddingDate ,
                            RM.PartnerBranchId ,
                            RM.PartnerLevel ,
                            ISNULL(RM.PartnerName, '') PartnerName ,
                            CASE WHEN RMemory.DateOfDeath IS NULL
                                 THEN N'Còn sống'
                                 ELSE N'Đã mất'
                            END Death ,
                            RMemory.DateOfDeath ,
                            RMemory.LunarDateOfDeath ,
                            RM.PartnerMaxLevel ,
                            Father.Level FatherLevel ,
                            Father.RootBranchId FatherBranchId ,
                            Mother.Level MotherLevel ,
                            Mother.RootBranchId MotherBranchId ,
                            RP1.maxLevel ,
                            RP.ImageLink
                  FROM      dbo.RootPerson RP
                            LEFT JOIN ( SELECT  *
                                        FROM    dbo.RootPerson
                                      ) Father ON Father.RootPersonId = RP.FatherRootPersonId
                            LEFT JOIN ( SELECT  *
                                        FROM    dbo.RootPerson
                                      ) Mother ON Mother.RootPersonId = RP.MotherRootPersonId
                            LEFT JOIN ( SELECT  RP1.RootBranchId ,
                                                MAX(RP1.Level) maxLevel
                                        FROM    RootPerson RP1
                                        WHERE   RP1.RootBranchId = 1
                                        GROUP BY RP1.RootBranchId
                                      ) RP1 ON RP1.RootBranchId = RP.RootBranchId
                            LEFT JOIN ( SELECT  CASE WHEN RPR.RootBranchId = 1
                                                     THEN RPR.RootPersonId
                                                     ELSE RPR1.RootPersonId
                                                END RootPersonId ,
                                                CASE WHEN RPR.RootBranchId = 1
                                                     THEN RPR1.RootPersonId
                                                     ELSE RPR.RootPersonId
                                                END PartnerPersonId ,
                                                CASE WHEN RPR.RootBranchId = 1
                                                     THEN RPR1.RootBranchId
                                                     ELSE RPR.RootBranchId
                                                END PartnerBranchId ,
                                                CASE WHEN RPR.RootBranchId = 1
                                                     THEN RPR1.Name
                                                     ELSE RPR.Name
                                                END PartnerName ,
                                                CASE WHEN RPR.RootBranchId = 1
                                                     THEN RPR1.Level
                                                     ELSE RPR.Level
                                                END PartnerLevel ,
                                                CASE WHEN RPR.RootBranchId = 1
                                                     THEN RPR1.PartnerMaxLevel
                                                     ELSE RPR.PartnerMaxLevel
                                                END PartnerMaxLevel ,
                                                RPRM.WeddingDate ,
                                                RPRM.Note
                                        FROM    dbo.RootPersonRelationMap RPRM
                                                LEFT JOIN ( SELECT
                                                              RPR.RootPersonId ,
                                                              RPR.RootBranchId ,
                                                              RPR.Name ,
                                                              RPR.Level ,
                                                              MAX(RPR.Level) PartnerMaxLevel
                                                            FROM
                                                              dbo.RootPerson RPR
                                                            GROUP BY RPR.RootPersonId ,
                                                              RPR.RootBranchId ,
                                                              RPR.Name ,
                                                              RPR.Level
                                                          ) RPR ON RPR.RootPersonId = RPRM.RelationRootPersonId
                                                LEFT JOIN ( SELECT
                                                              RPR1.RootPersonId ,
                                                              RPR1.RootBranchId ,
                                                              RPR1.Name ,
                                                              RPR1.Level ,
                                                              MAX(RPR1.Level) PartnerMaxLevel
                                                            FROM
                                                              dbo.RootPerson RPR1
                                                            GROUP BY RPR1.RootPersonId ,
                                                              RPR1.RootBranchId ,
                                                              RPR1.Name ,
                                                              RPR1.Level
                                                          ) RPR1 ON RPR1.RootPersonId = RPRM.RootPersonId
                                        WHERE   RPR.RootBranchId = 1
                                                OR RPR1.RootBranchId = 1
                                      ) RM ON RM.RootPersonId = RP.RootPersonId
                            LEFT JOIN ( SELECT  *
                                        FROM    dbo.RootPersonMemory
                                      ) RMemory ON RMemory.RootPersonId = RP.RootPersonId
                  WHERE     1 = 1
                            AND RP.RootBranchId = 1
                  UNION
                  SELECT    Children.RootPersonId ,
                            Children.Level ,
                            Children.Name ,
                            Children.FatherRootPersonId ,
                            Children.MotherRootPersonId ,
                            ISNULL(F.Name, '') FatherName ,
                            ISNULL(M.Name, '') MotherName ,
                            F.SortOrder FS ,
                            FORMAT(Children.DateOfBirth, 'dd/MM/yyyy') DateOfBirth ,
                            CASE WHEN Children.Sex = 1 THEN N'Nam'
                                 ELSE N'Nữ'
                            END Sex ,
                            ISNULL(Children.Address, '') Address ,
                            ISNULL(Children.Phone, '') Phone ,
                            Children.SortOrder ,
                            Children.RootBranchId ,
                            NULL PartnerPersonId ,
                            NULL WeddingDate ,
                            NULL PartnerBranchId ,
                            NULL PartnerLevel ,
                            NULL PartnerName ,
                            CASE WHEN RMemory.DateOfDeath IS NULL
                                 THEN N'Còn sống'
                                 ELSE N'Đã mất'
                            END Death ,
                            NULL DateOfDeath ,
                            NULL LunarDateOfDeath ,
                            NULL PartnerMaxLevel ,
                            NULL FatherLevel ,
                            NULL FatherBranchId ,
                            NULL MotherLevel ,
                            NULL MotherBranchId ,
                            NULL maxLevel ,
                            Children.ImageLink
                  FROM      dbo.RootPerson Children
                            INNER JOIN ( SELECT RP.RootPersonId ,
                                                RP.Name
                                         FROM   dbo.RootPerson RP
                                                LEFT JOIN ( SELECT
                                                              CASE
                                                              WHEN RPR.RootBranchId = 1
                                                              THEN RPR.RootPersonId
                                                              ELSE RPR1.RootPersonId
                                                              END RootPersonId ,
                                                              CASE
                                                              WHEN RPR.RootBranchId = 1
                                                              THEN RPR1.RootPersonId
                                                              ELSE RPR.RootPersonId
                                                              END PartnerPersonId ,
                                                              CASE
                                                              WHEN RPR.RootBranchId = 1
                                                              THEN RPR1.RootBranchId
                                                              ELSE RPR.RootBranchId
                                                              END PartnerBranchId ,
                                                              CASE
                                                              WHEN RPR.RootBranchId = 1
                                                              THEN RPR1.Name
                                                              ELSE RPR.Name
                                                              END PartnerName ,
                                                              CASE
                                                              WHEN RPR.RootBranchId = 1
                                                              THEN RPR1.Level
                                                              ELSE RPR.Level
                                                              END PartnerLevel ,
                                                              CASE
                                                              WHEN RPR.RootBranchId = 1
                                                              THEN RPR1.PartnerMaxLevel
                                                              ELSE RPR.PartnerMaxLevel
                                                              END PartnerMaxLevel ,
                                                              RPRM.WeddingDate ,
                                                              RPRM.Note
                                                            FROM
                                                              dbo.RootPersonRelationMap RPRM
                                                              LEFT JOIN ( SELECT
                                                              RPR.RootPersonId ,
                                                              RPR.RootBranchId ,
                                                              RPR.Name ,
                                                              RPR.Level ,
                                                              MAX(RPR.Level) PartnerMaxLevel
                                                              FROM
                                                              dbo.RootPerson RPR
                                                              GROUP BY RPR.RootPersonId ,
                                                              RPR.RootBranchId ,
                                                              RPR.Name ,
                                                              RPR.Level
                                                              ) RPR ON RPR.RootPersonId = RPRM.RelationRootPersonId
                                                              LEFT JOIN ( SELECT
                                                              RPR1.RootPersonId ,
                                                              RPR1.RootBranchId ,
                                                              RPR1.Name ,
                                                              RPR1.Level ,
                                                              MAX(RPR1.Level) PartnerMaxLevel
                                                              FROM
                                                              dbo.RootPerson RPR1
                                                              GROUP BY RPR1.RootPersonId ,
                                                              RPR1.RootBranchId ,
                                                              RPR1.Name ,
                                                              RPR1.Level
                                                              ) RPR1 ON RPR1.RootPersonId = RPRM.RootPersonId
                                                            WHERE
                                                              RPR.RootBranchId = 1
                                                              OR RPR1.RootBranchId = 1
                                                          ) RM ON RM.RootPersonId = RP.RootPersonId
                                         WHERE  RP.RootBranchId = 1
                                                AND RP.Sex = 0
                                                AND RM.PartnerPersonId IS NOT NULL
                                       ) Mother ON Mother.RootPersonId = Children.MotherRootPersonId
                            LEFT JOIN ( SELECT  *
                                        FROM    dbo.RootPerson
                                      ) F ON F.RootPersonId = Children.FatherRootPersonId
                            LEFT JOIN ( SELECT  *
                                        FROM    dbo.RootPerson
                                      ) M ON M.RootPersonId = Children.MotherRootPersonId
                            LEFT JOIN ( SELECT  *
                                        FROM    dbo.RootPersonMemory
                                      ) RMemory ON RMemory.RootPersonId = Children.RootPersonId
                ) Rs
        WHERE   1 = 1
                AND Rs.RootBranchId = 1
                AND Rs.Level IN ( 1, 2, 3 ); 
		
		--ketqua
        SELECT  A.*, RB.BranchName
		INTO #tmpKQ
        FROM    ( SELECT    *
                  FROM      #tmpTable
                  UNION
                  SELECT    PN.RootPersonId id ,
                            PN.Name name ,
                            T.id pid ,
                            PN.ImageLink img ,
                            'partner' tags ,
                            PN.RootPersonId ,
                            PN.RootBranchId ,
                            PN.Level ,
                            CASE WHEN PN.Sex = 1 THEN N'Nam'
                                 ELSE N'Nữ'
                            END Sex ,
                            ISNULL(PN.Phone, '') Phone
                  FROM      dbo.RootPerson PN
                            INNER JOIN ( SELECT *
                                         FROM   #tmpTable
                                       ) T ON T.PartnerPersonId = PN.RootPersonId
                  WHERE     T.RootBranchId = 1
                  UNION
                  SELECT    Child.RootPersonId id ,
                            Child.Name name ,
                            T1.id pid ,
                            Child.ImageLink img ,
                            '' tags ,
                            Child.RootPersonId ,
                            Child.RootBranchId ,
                            Child.Level ,
                            CASE WHEN Child.Sex = 1 THEN N'Nam'
                                 ELSE N'Nữ'
                            END Sex ,
                            ISNULL(Child.Phone, '') Phone
                  FROM      dbo.RootPerson Child
                            INNER JOIN ( SELECT *
                                         FROM   #tmpTable
                                       ) T1 ON T1.id = Child.MotherRootPersonId
                ) A
                INNER JOIN ( SELECT RootBranchId ,
                                    Name AS BranchName
                             FROM   dbo.RootBranch
                           ) RB ON RB.RootBranchId = A.RootBranchId; 
SELECT *
FROM(
	SELECT *
	FROM(
		SELECT * 
		FROM #tmpTable 
		WHERE id = 12
		UNION
		SELECT t1.*
		FROM #tmpTable t
		LEFT JOIN(
			SELECT *
			FROM #tmpTable t1
		)t1 ON t1.id = t.pid
		WHERE t1.id IS NOT NULL 
	) Family
	UNION
	SELECT	PN.RootPersonId id,
			PN.Name name,
			T.id pid,
			PN.ImageLink img,
			'partner' tags,
			PN.RootPersonId,
			PN.RootBranchId,
			PN.Level,
			CASE 
				WHEN PN.Sex = 1 THEN N'Nam' ELSE N'Nữ'
			END Sex,
			ISNULL(PN.Phone,'') Phone
	FROM dbo.RootPerson PN
	INNER JOIN(
			SELECT * 
			FROM #tmpTable 
			WHERE id = 12
			UNION
			SELECT t1.*
			FROM #tmpTable t
			LEFT JOIN(
				SELECT *
				FROM #tmpTable t1
			)t1 ON t1.id = t.pid
			WHERE t1.id IS NOT NULL 
	) T ON T.PartnerPersonId = PN.RootPersonId
	WHERE T.RootBranchId =  1 
	UNION
	SELECT Child.RootPersonId id,
			Child.Name name,
			T1.id pid,
			Child.ImageLink img,
			'' tags,
			Child.RootPersonId,
			Child.RootBranchId,
			Child.Level,
			CASE 
				WHEN Child.Sex = 1 THEN N'Nam' ELSE N'Nữ'
			END Sex,
			ISNULL(Child.Phone,'') Phone
	FROM dbo.RootPerson Child
	INNER JOIN (
		SELECT * 
		FROM #tmpTable 
		WHERE id = 12
		UNION
		SELECT t1.*
		FROM #tmpTable t
		LEFT JOIN(
			SELECT *
			FROM #tmpTable t1
		)t1 ON t1.id = t.pid
		WHERE t1.id IS NOT NULL
	) T1 ON T1.id = Child.MotherRootPersonId
) A 
INNER JOIN (
	SELECT RootBranchId,Name as BranchName
	FROM dbo.RootBranch  
)RB ON RB.RootBranchId = A.RootBranchId 