import math
import time
import cython
start_time = time.time()

cpdef float Mars_Atm_PTRho(float h):
    ''' This function calculates the atmospheric properties at a given height in the Martian atmosphere.
    
    ### INPUTS ###
    Height (h), units = meters, abbreviated units = [m], type h: float
    
    ### OUTPUTS ###
    Pressure (P), units = pascals, abbreviated units = [Pa]    
    Temperature (T), units = Kelvin, abbreviated units = [K]
    Density (rho), units = kilogram per cubic meter, abbreviated units = [kg/m^3]

    ### SOURCES ###
    NASA WEBSITE: https://www.grc.nasa.gov/www/k-12/rocket/atmosmrm.html
    (not included yet) MARS GRAM MODEL: https://ntrs.nasa.gov/citations/20140003184 
    '''
    cdef float h
    cdef float P
    cdef float T
    cdef float rho
    
    
    if h<0 or h>100000:
        return print('Error. Elevation cannot be below 0 meters or above 100,000 meters.\nPlease input an elevation between 0 and 100,000 meters.')
    else:
        #Calculate the pressure in Pascals
        P = 699*math.exp(-0.00009*h) # Converted original eqation from kilopascals to pascals
        
        #Calculate the temperature in Kelvin
        if h<7000:
            T = (-31-0.000998*h)+273.15 #Lower atmosphere (<7000meters)
        else:
            T = (-23.4-0.00222*h)+273.15 #Upper atmosphere (>7000meters)
        
        #Calculate the density in kilogram per cubic mete
        rho = P/(0.291*T)
        return [P,T,rho];

martian_gases = ['CO2','N2','Ar','O2','CO','Other(H2O,NO,Ne,Kr,Xe)'] #https://www.space.com/16903-mars-atmosphere-climate-weather.html
cas_comp = [95.32,2.70,1.60,0.13,0.08,0.17]