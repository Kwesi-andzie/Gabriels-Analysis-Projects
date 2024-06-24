CREATE DATABASE PortfolioProject_DB

SELECT *
FROM PortfolioProject_DB .. CovidDeaths$
WHERE continent is not null
ORDER BY 3,4

--SELECT *
--FROM PortfolioProject_DB .. CovidVaccinations$
--ORDER BY 3,4

SELECT location,date, total_cases, new_cases,total_deaths,population
FROM PortfolioProject_DB..CovidDeaths$
ORDER BY 1,2

SELECT location,date, total_cases, new_cases,total_deaths, (TOTAL_DEATHS/TOTAL_CASES)*100 AS DEATHPERCENTAGE
FROM PortfolioProject_DB..CovidDeaths$
WHERE location LIKE '%STATES%'
ORDER by 1,2

---looking at total cases v total deaths
---showing likelihood of dying if you contract covid in your country
SELECT location,date, total_cases, total_deaths, (TOTAL_DEATHS/TOTAL_CASES)*100 AS DEATHPERCENTAGE
FROM PortfolioProject_DB..CovidDeaths$
WHERE location LIKE '%STATES%'
ORDER by 1,2


--looking at total cases v population
SELECT location,date, total_cases, population, (total_cases/population)*100 AS DEATHPERCENTAGE
FROM PortfolioProject_DB..CovidDeaths$
--WHERE location LIKE '%STATES%'
ORDER by 1,2

--looking at countries with highhest infection rate compared to population

SELECT location, population, MAX(total_cases) as HighestInfectionCount,MAX((total_cases/population))*100 AS PercentPopulationInfected
FROM PortfolioProject_DB..CovidDeaths$
--WHERE location LIKE '%STATES%'
GROUP BY Location,population
ORDER BY percentpopulationinfected desc

--Showing countries w/ the highest death count per population
SELECT location, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM PortfolioProject_DB..CovidDeaths$
--WHERE location LIKE '%STATES%'
WHERE continent is not null
GROUP BY Location
ORDER BY TotalDeathCount desc



--- break things down by continent
SELECT continent, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM PortfolioProject_DB..CovidDeaths$
--WHERE location LIKE '%STATES%'
WHERE continent is not null
GROUP BY continent
ORDER BY TotalDeathCount desc


---accurate readings of totaldeath counts by continent
SELECT location, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM PortfolioProject_DB..CovidDeaths$
--WHERE location LIKE '%STATES%'
WHERE continent is null
GROUP BY continent
ORDER BY TotalDeathCount desc


---breaking down global numbers
SELECT date,total_cases,total_deaths, (total_deaths/total_cases) * 100 as  deathpercentage
from PortfolioProject_DB..CovidDeaths$
---where location like '%states%'
where continent is not null
group by continent 
order by 1,2


 SELECT date, sum(new_cases), sum(cast(new_deaths as int)),sum(new_deaths)/sum(new_cases) *100 as deathpercentage
from PortfolioProject_DB..CovidDeaths$
---where location like '%states%'
where continent is not null
group by date 
order by 1,2 

---Global Numbers 
SELECT date, sum(new_cases) as total_cases, sum(cast(new_deaths as int)) as total_deaths,sum(cast(new_deaths as int))/sum(new_cases) * 100 deathpercentage
FROM PortfolioProject_DB..CovidDeaths$
---WHERE location LIKE '%STATES%'
where continent is not null
group by date 
ORDER by 1,2

SELECT *
FROM PortfolioProject_DB..CovidDeaths$ dea
Join PortfolioProject_DB .. CovidVaccinations$ vac
on dea.location = vac.location
and dea.date = vac.date 

