LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY input_port IS
    GENERIC (
        DATA_SIZE : INTEGER := 16
    );
    PORT (
        clk : IN STD_LOGIC; -- Clock signal
        reset : IN STD_LOGIC; -- Reset signal
        data_in : IN STD_LOGIC_VECTOR(DATA_SIZE - 1 DOWNTO 0);
        data_out : OUT STD_LOGIC_VECTOR(DATA_SIZE - 1 DOWNTO 0)
    );
END ENTITY input_port;

ARCHITECTURE behavior OF input_port IS

    -- Internal signal for the input port
    SIGNAL input_signal : STD_LOGIC_VECTOR(DATA_SIZE - 1 DOWNTO 0);
    SIGNAL temp_output_value : STD_LOGIC_VECTOR(DATA_SIZE - 1 DOWNTO 0);

BEGIN

    -- Map the data_in port to the internal signal
    input_signal <= data_in;

    -- Process block to handle the logic
    PROCESS (clk, reset)
    BEGIN
        IF reset = '1' THEN
            -- Reset the data_out to zero
            temp_output_value <= (OTHERS => '0');
            ELSIF rising_edge(clk) THEN
            -- Example logic: Pass the input directly to the output
            temp_output_value <= input_signal;
        END IF;
    END PROCESS;

    -- Assign the processed value to data_out
    data_out <= temp_output_value;

END ARCHITECTURE behavior;