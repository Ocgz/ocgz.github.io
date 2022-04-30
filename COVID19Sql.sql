SELECT *
FROM dbo.CovidDeaths


SELECT *
FROM dbo.CovidVaccinations


Select location, total_cases, new_cases, total_deaths, population
FROM dbo.CovidDeaths
Order by 1,2


--Total deaths per continent
Select continent, max(total_deaths) as Total_deaths
from dbo.CovidDeaths
WHERE continent is not NULL
GROUP BY continent


--Showing countries with highest death count per population
Select continent, max(cast(Total_deaths as int)) as TotalDeathCount
FROM dbo.CovidDeaths
WHERE continent IS NOT NULL
Group by continent
Order by TotalDeathCount desc


--Show curent total cases and total deaths for March 2022
Select distinct(continent), date, total_cases, total_deaths
From dbo.CovidDeaths
WHERE continent is not null and date >= '2022-03-01 00:00:00.000' and date <= '2022-04-01 00:00:00.000'
ORDER BY date DESC



--SQL Queries to be created as visualizations

--1. Show curent total cases and total deaths for March 2022
Select continent, location, date, total_cases, total_deaths
From dbo.CovidDeaths
WHERE location = 'United States' AND date >= '2021-12-01 00:00:00.000' AND date <= '2022-03-31 00:00:00.000'
ORDER BY continent


--2. Total deaths per continent
Select location, MAX(cast(total_deaths as int)) AS TotalDeathCount
From dbo.CovidDeaths
WHERE continent IS NULL
Group by location
ORDER BY TotalDeathCount DESC


--3. Percentage of people infected per country
Select location, population, max(total_cases) as current_total_infected, max(total_cases/population)*100 AS Percent_infected
FROM dbo.CovidDeaths
WHERE location IS NOT NULL
GROUP by location, population
ORDER BY Percent_infected DESC


--4. Percentage of deaths per continent
Select location, population, date, max(cast(total_deaths as int)) as current_total_deaths, max(total_deaths/population)*100 AS Percent_deaths
FROM dbo.CovidDeaths
WHERE location IS NOT NULL
GROUP by location, population, date
ORDER by Percent_deaths DESC
