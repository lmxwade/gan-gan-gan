select 
    Name
from Candidate where Id = 
    (SELECT 
        CandidateId 
    from Vote 
    GROUP by CandidateId
    order by count(id) DESC
    limit 1 

    )