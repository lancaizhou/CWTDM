--------------------------------------------------------------------------------
-- (c) Copyright 2011 - 2013 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--------------------------------------------------------------------------------
-- Description:
-- This is an example testbench for the CORDIC IP core.
-- The testbench has been generated by Vivado to accompany the IP core
-- instance you have generated.
--
-- This testbench is for demonstration purposes only.  See note below for
-- instructions on how to use it with your core.
--
-- See the CORDIC product guide for further information
-- about this core.
--
--------------------------------------------------------------------------------
-- Using this testbench
--
-- This testbench instantiates your generated CORDIC core
-- instance named "cordic_0".
--
-- Use Vivado's Run Simulation flow to run this testbench.  See the Vivado
-- documentation for details.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity tb_cordic_00 is
end tb_cordic_00;

architecture tb of tb_cordic_00 is

  -----------------------------------------------------------------------
  -- Timing constants
  -----------------------------------------------------------------------
  constant CLOCK_PERIOD : time := 10 ns;

  -----------------------------------------------------------------------
  -- DUT input signals
  -----------------------------------------------------------------------

  -- General inputs
  signal aclk               : std_logic := '1';  -- the master clock(for testbench, DUT is asynchronous)

  -- Slave channel CARTESIAN inputs
  signal s_axis_cartesian_tvalid    : std_logic := '1';  -- TVALID for channel S_AXIS_CARTESIAN
  signal s_axis_cartesian_tdata     : std_logic_vector(31 downto 0) := (others => '0');  -- TDATA for channel S_AXIS_CARTESIAN

  -- Slave channel PHASE inputs
  signal s_axis_phase_tvalid    : std_logic := '0';  -- TVALID for channel S_AXIS_PHASE
  signal s_axis_phase_tdata     : std_logic_vector(15 downto 0) := (others => '0');  -- TDATA for channel S_AXIS_PHASE

  -----------------------------------------------------------------------
  -- DUT output signals
  -----------------------------------------------------------------------

  -- Master channel DOUT outputs
  signal m_axis_dout_tvalid : std_logic := '0';  -- TVALID for channel M_AXIS_DOUT
  signal m_axis_dout_tdata  : std_logic_vector(15 downto 0) := (others => '0');  -- TDATA for channel M_AXIS_DOUT

  -----------------------------------------------------------------------
  -- Aliases for AXI channel TDATA fields
  -- These are a convenience for viewing data in a simulator waveform viewer.
  -- If using ModelSim or Questa, add "-voptargs=+acc=n" to the vsim command
  -- to prevent the simulator optimizing away these signals.

  -----------------------------------------------------------------------
  -- Testbench signals
  -----------------------------------------------------------------------



  -----------------------------------------------------------------------
  -- Constants, types and functions to create input data
  -- The CORDIC is fed two sinusoids exp(+/-jwt) of different frequencies and amplitudes:
  --   channel CARTESIAN: exp(+jwt), frequency = clock / 30,
  --   channel PHASE: exp(-jwt), frequency = clock / 32,
  -----------------------------------------------------------------------

  
begin

  -----------------------------------------------------------------------
  -- Instantiate the DUT
  -----------------------------------------------------------------------

  dut : entity work.cordic_0
    port map (
      s_axis_cartesian_tvalid     => s_axis_cartesian_tvalid,
      s_axis_cartesian_tdata      => s_axis_cartesian_tdata,
      m_axis_dout_tvalid  => m_axis_dout_tvalid,
      m_axis_dout_tdata   => m_axis_dout_tdata
      );

  -----------------------------------------------------------------------
  -- Generate clock
  -----------------------------------------------------------------------

  clock_gen : process
  begin
		wait for CLOCK_PERIOD;
      aclk <= '0';
      wait for CLOCK_PERIOD/2;
      aclk <= '1';
  end process clock_gen;

  process
	  begin
	  wait for 10 ns;
		s_axis_cartesian_tdata<="00000000000000000000000100000000";
		wait for 10 ns;
		s_axis_cartesian_tdata<="00000000000000000000010000000000";
		wait for 10 ns;
		s_axis_cartesian_tdata<="00000000000001000000000000000000";
		wait for 10 ns;
		s_axis_cartesian_tdata<="10100000000001000000000000000000";
	  end process;
  -----------------------------------------------------------------------
  -- Generate inputs
  -----------------------------------------------------------------------

  

end tb;
