(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: MiguelProjetoFuzzy
 * File: MiguelProjetoFuzzy.st
 * Author: supervisorio
 * Created: November 30, 2023
 ********************************************************************
 * Implementation of program MiguelProjetoFuzzy
 ********************************************************************)

PROGRAM _CYCLIC
	
	tensao :=  X / 3276.7;
	pvAtualSemFiltro := 47.6537 * tensao - 3.5648;
	
	filtro.enable := TRUE;
	filtro.base := 40;
	filtro.x := pvAtualSemFiltro;
	filtro();
	
	pvAtual := filtro.y;
	erro := pvAtual - sp;
	deltaErro := pvAtual - pvAnterior;
	
	(* Função de Pertinência do Erro *)
	
	MNE := 0;
	PNE := 0;
	ZEE := 0;
	PPE := 0;
	MPE := 0;
	
	IF (erro <= -20) THEN
		MNE := 1;
	ELSIF (erro > -20) AND (erro <= -10) THEN
		MNE := -(erro + 10) / 10.0;
		PNE := 1 - MNE;
	ELSIF (erro > -10) AND (erro <= 0) THEN
		ZEE := (erro + 10) / 10.0;
		PNE := 1 - ZEE;
	ELSIF (erro > 0) AND (erro <= 10) THEN
		PPE := erro / 10.0;
		ZEE := 1 - PPE;
	ELSIF (erro > 10) AND (erro <= 20) THEN
		MPE := (erro - 10) / 10.0;
		PPE := 1 - MPE;
	ELSIF (erro > 20) THEN
		MPE := 1;
	END_IF;
	
	(* Função de Pertinência do Delta Erro *)
	
	MNDE := 0;
	PNDE := 0;
	ZEDE := 0;
	PPDE := 0;
	MPDE := 0;
	
	IF (deltaErro <= -0.6) THEN
		MNDE := 1;
	ELSIF (deltaErro > -0.6) AND (deltaErro <= -0.3) THEN
		PNDE := (deltaErro + 0.6) / 0.3;
		MNDE := 1 - PNDE;
	ELSIF (deltaErro > -0.3) AND (deltaErro <= 0) THEN
		ZEDE := (deltaErro + 0.3) / 0.3;
		PNDE := 1 - ZEDE;
	ELSIF (deltaErro > 0) AND (deltaErro <= 0.3) THEN
		PPDE := deltaErro / 0.3;
		ZEDE := 1 - PPDE;
	ELSIF (deltaErro > 0.3) AND (deltaErro <= 0.6) THEN
		MPDE := (deltaErro - 0.3) / 0.3;
		PPDE := 1 - MPDE;
	ELSIF (deltaErro > 0.6) THEN
		MPDE := 1;
	END_IF;

	(* Regras *)
	
	PMB_F := 0;
	PB_F := 0;
	PM_F := 0;
	PA_F := 0;
	PMA_F := 0;
	
	(** Linha 1 **)
	IF (MNE <> 0) AND (MNDE <> 0) THEN
		PMA_F := MAX(PMA_F, MIN(MNE, MNDE));
	END_IF;
	IF (PNE <> 0) AND (MNDE <> 0) THEN
		PM_F := MAX(PM_F, MIN(PNE, MNDE));
	END_IF;
	IF (ZEE <> 0) AND (MNDE <> 0) THEN
		PB_F := MAX(PB_F, MIN(ZEE, MNDE));
	END_IF;
	IF (PPE <> 0) AND (MNDE <> 0) THEN
		PB_F := MAX(PB_F, MIN(PPE, MNDE));
	END_IF;
	IF (MPE <> 0) AND (MNDE <> 0) THEN
		PB_F := MAX(PB_F, MIN(MPE, MNDE));
	END_IF;
	
	(** Linha 2 **)
	IF (MNE <> 0) AND (PNDE <> 0) THEN
		PA_F := MAX(PA_F, MIN(MNE, PNDE));
	END_IF;
	IF (PNE <> 0) AND (PNDE <> 0) THEN
		PM_F := MAX(PM_F, MIN(PNE, PNDE));
	END_IF;
	IF (ZEE <> 0) AND (PNDE <> 0) THEN
		PB_F := MAX(PB_F, MIN(ZEE, PNDE));
	END_IF;
	IF (PPE <> 0) AND (PNDE <> 0) THEN
		PB_F := MAX(PB_F, MIN(PPE, PNDE));
	END_IF;
	IF (MPE <> 0) AND (PNDE <> 0)  THEN
		PMB_F := MAX(PMB_F, MIN (MPE, PNDE));
	END_IF;
	
	(** Linha 3 **)
	IF (MNE <> 0) AND (ZEDE <> 0) THEN
		PMA_F := MAX(PMA_F, MIN(MNE, ZEDE));
	END_IF;
	IF (PNE <> 0) AND (ZEDE <> 0) THEN
		PA_F := MAX(PA_F, MIN(PNE, ZEDE));
	END_IF;
	IF (ZEE <> 0) AND (ZEDE <> 0) THEN
		PM_F := MAX(PM_F, MIN(ZEE, ZEDE));
	END_IF;
	IF (PPE <> 0) AND (ZEDE <> 0) THEN
		PB_F := MAX(PB_F, MIN(PPE, ZEDE));
	END_IF;
	IF (MPE <> 0) AND (ZEDE <> 0) THEN
		PMB_F := MAX(PMB_F, MIN(MPE, ZEDE));
	END_IF;
	
	(** Linha 4 **)
	IF (MNE <> 0) AND (PPDE <> 0) THEN
		PA_F := MAX(PA_F, MIN(MNE, PPDE));
	END_IF;
	IF (PNE <> 0) AND (PPDE <> 0) THEN
		PM_F := MAX(PM_F, MIN(PNE, PPDE));
	END_IF;
	IF (ZEE <> 0) AND (PPDE <> 0) THEN
		PB_F := MAX(PB_F, MIN(ZEE, PPDE));
	END_IF;
	IF (PPE <> 0) AND (PPDE <> 0) THEN
		PB_F := MAX(PB_F, MIN(PPE, PPDE));
	END_IF;
	IF (MPE <> 0) AND (PPDE <> 0) THEN
		PMB_F := MAX(PMB_F, MIN(MPE, PPDE));
	END_IF;
	
	(** Linha 5 **)
	IF (MNE <> 0) AND (MPDE <> 0) THEN
		PA_F := MAX(PA_F, MIN(MNE, MPDE));
	END_IF;
	IF (PNE <> 0) AND (MPDE <> 0) THEN
		PM_F := MAX(PM_F, MIN(PNE, MPDE));
	END_IF;	
	IF (ZEE <> 0) AND (MPDE <> 0) THEN
		PB_F := MAX(PB_F, MIN(ZEE, MPDE));
	END_IF;
	IF (PPE <> 0) AND (MPDE <> 0) THEN
		PB_F := MAX(PB_F, MIN(PPE,MPDE));
	END_IF;	
	IF (MPE <> 0) AND (MPDE <> 0) THEN
		PMB_F := MAX(PMB_F, MIN(MPE, MPDE));
	END_IF;
																								
	P := ((8.33 * PMB_F) + (25.0 * PB_F) + (50.0 * PM_F) + (75.0 * PA_F) + (91.66 * PMA_F)) / (PMB_F + PB_F + PM_F + PA_F + PMA_F);
	
	IF LIGA = TRUE THEN
		HABILITA_TRACE := TRUE;
		Y := REAL_TO_INT(P * 327.67);
	END_IF;
	
	IF LIGA = FALSE THEN
		Y := 0;
		HABILITA_TRACE := FALSE;
	END_IF;
	
	pvAnterior := pvAtual;


END_PROGRAM
