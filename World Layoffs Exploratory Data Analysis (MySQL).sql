SELECT * 
FROM layoffs_staging2;

SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2;

SELECT*
FROM layoffs_staging2
WHERE percentage_laid_off=1
ORDER BY funds_raised_millions desc;

SELECT company, SUM(total_laid_off)
from layoffs_staging2
GROUP BY company
ORDER by 2 desc;
SELECT MIN(DATE), MAX(DATE)
FROM layoffs_staging2;

SELECT industry, SUM(total_laid_off)
from layoffs_staging2
GROUP BY industry
ORDER by 2 desc;

SELECT country, SUM(total_laid_off)
from layoffs_staging2
GROUP BY country
ORDER by 2 desc;

SELECT `date`, SUM(total_laid_off)
from layoffs_staging2
GROUP BY `date`
ORDER by 1 desc;

SELECT YEAR( `date`), SUM(total_laid_off)
from layoffs_staging2
GROUP BY YEAR(`date`)
ORDER by 1 desc;


SELECT  stage, SUM(total_laid_off)
from layoffs_staging2
GROUP BY stage
ORDER by 1 desc;

select substring(`date`,1,7) AS `MONTH`, sum(total_laid_off)
from layoffs_staging2
GROUP BY `MONTH`
ORDER BY 1 ASC;

select substring(`date`,1,7) AS `MONTH`, sum(total_laid_off)
from layoffs_staging2
WHERE substring(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC;

WITH ROlling_total AS
(
select substring(`date`,1,7) AS `MONTH`, sum(total_laid_off) AS total_off
from layoffs_staging2
WHERE substring(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC
)
select `month`, total_off,
sum(total_off) OVER(ORDER BY `MONTH`) AS Rolling_total
from Rolling_total ;

select company, sum( total_laid_off)
from layoffs_staging2
group by company
order by 2 desc;

SELECT COMPANY, YEAR(`DATE`), sum(total_laid_off)
from layoffs_staging2
Group by company, year(`date`)
order by 3 desc;

WITH COMPANY_YEAR (company, years, total_laid_off) AS
(
SELECT COMPANY, YEAR(`DATE`), sum(total_laid_off)
from layoffs_staging2
Group by company, year(`date`)
),COMPANY_YEAR_RANK AS
(SELECT* ,
Dense_rank() OVER(partition by years order by total_laid_off DESC) AS Ranking 
FROM COMPANY_YEAR
WHERE YEARS IS NOT NULL
)
SELECT*
FROM COMPANY_YEAR_RANK
WHERE RANKING <=5
;