


-- looking at total cases vs total deaths  in colombia 

select location , date , total_cases ,  total_deaths , round((total_deaths/total_cases)*100,2) as deathPercentage  , population  from CovidDeaths$ 
where location ='colombia'

order by 1 ,2 ;

-- looking at total cases vs population in colombia 
--	shows what percentage of population got Covid in Colombia 

select location , date , total_cases , population , total_cases / population  *100 as Percetage_cases 
from CovidDeaths$
where location = 'colombia'
order by 1 , 2 ; 


-- looking at countries with highest infection rate compared to population  
select location , population ,max(total_cases) as HighestInfectionCount,max((total_cases / population ))*100 as highest_per_population
from CovidDeaths$ 
group by location , population 
order by highest_per_population desc ;

-- Showing Countries with highest death count per population

select location  , max(cast(total_deaths as int))as TotalDeathsCount 
from CovidDeaths$ where continent is not null 
group by location 
order by TotalDeathsCount desc ;

-- Total deaths account of continent 

select   continent , max(cast(total_deaths as int)) as TotalDeathsCount 
from dbo.CovidDeaths$
where continent is not null  
group by continent
order by TotalDeathsCount desc;

-- GLOBAL NUMBERS

select sum(new_cases) as total_cases , sum(cast(new_deaths as int)) as total_deaths ,
sum(cast(new_deaths as int))/sum(new_cases)*100 DeathPercentage 
from CovidDeaths$
where continent is not null
order by 1 , 2 ; 

