create or replace
FUNCTION           "FN_GET_RATE_EFF_FROM_DT" (
      currentRateUuid in VARCHAR2)
      RETURN DATE
  IS
    lastRateEffFromDt DATE;
    lastOrgiFromDt DATE;
    nullDt DATE;    
    tariffRateP2pRateUuid       CHAR(32);
    tariffRateSurchargeRateUuid CHAR(32);
    Currenteffto Date;
    
    /*******
    根据上一条记录的有效结束时间，自动计算出本条记录的有效起始时间。
本条记录的有效起始时间 = 上一条记录的有效结束时间 + 1天。
第一条记录的有效起始时间，根据EFF_FM来确定，其他记录的EFF_FM不起作用。
********/
  Begin
   SELECT MIN(EFF_FM) INTO nullDt
        From Tariff_Rate_Eff_Period
        Where TARIFF_RATE_EFF_PERIOD_UUID=currentRateUuid;
    
    if nullDt is null then 
      nulldt:= TO_DATE('01/01/1900', 'MM/DD/YYYY');
    end if;
    
    SELECT TARIFF_P2P_RATE_UUID,
      TARIFF_SURCHARGE_RATE_UUID,
      EFF_TO
    INTO tariffRateP2pRateUuid,
      tariffRateSurchargeRateUuid,
      currentEffTo
    FROM TARIFF_RATE_EFF_PERIOD
    WHERE TARIFF_RATE_EFF_PERIOD_UUID=currentRateUuid;
        
        
    If Tariffratep2prateuuid  Is Not Null Then
        SELECT MIN(EFF_FM) INTO lastOrgiFromDt
        From Tariff_Rate_Eff_Period
        Where Tariff_P2p_Rate_Uuid=Tariffratep2prateuuid;
        
        
        SELECT MAX(EFF_TO) INTO lastRateEffFromDt
        FROM TARIFF_RATE_EFF_PERIOD
        WHERE TARIFF_P2P_RATE_UUID=tariffRateP2pRateUuid
        And Eff_To <Currenteffto;
        
        if(lastRateEffFromDt is null) then
            return nvl(lastOrgiFromDt,nullDt);
          else          
            RETURN lastRateEffFromDt+1;
        END IF;
    END IF;
      
      
    If Tariffratesurchargerateuuid Is Not Null Then
        SELECT MIN(EFF_FM) INTO lastOrgiFromDt
        From Tariff_Rate_Eff_Period
        Where Tariff_P2p_Rate_Uuid=tariffRateSurchargeRateUuid;
        
        SELECT MAX(EFF_TO)
        INTO lastRateEffFromDt
        FROM TARIFF_RATE_EFF_PERIOD
        WHERE TARIFF_SURCHARGE_RATE_UUID=tariffRateSurchargeRateUuid
        AND EFF_TO <currentEffTo;

       if(lastRateEffFromDt is null) then
            return nvl(lastOrgiFromDt,nullDt);
          else          
            Return Lastrateefffromdt+1;
       END IF;
    END IF;
   
  
        
    Return Nvl(Lastorgifromdt,Nulldt);
  END;