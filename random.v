module random(
					input             clk_50m,  	//50MHz时钟
					input             rst_n,    	//复位，低电平有效
					input             load,  		//seed加载信号，高电平有效
					input      [15:0]	seed,     	//随机种子
					output reg [15:0]	rand_num  	//16位随机数
);


//反馈系数为g0g1g2g3g4g5g6g7g8g9g10g11g12g13g14g15g16=101110000_001110001

always@(posedge clk_50m or negedge rst_n)
begin
    if(!rst_n)
        rand_num    <=16'b0;
		  
    else if(load)
        rand_num <=seed;   
    else
        begin
            rand_num[0] <= rand_num[15];
            rand_num[1] <= rand_num[0];
            rand_num[2] <= rand_num[1];
            rand_num[3] <= rand_num[2];
            rand_num[4] <= rand_num[3] ^~rand_num[15];
            rand_num[5] <= rand_num[4] ^~rand_num[15];
            rand_num[6] <= rand_num[5] ^~rand_num[15];
            rand_num[7] <= rand_num[6];
				rand_num[8] <= rand_num[7];
				rand_num[9] <= rand_num[8];
				rand_num[10]<= rand_num[9];
				rand_num[11]<= rand_num[10];
				rand_num[12]<= rand_num[11]^~rand_num[15];
				rand_num[13]<= rand_num[12]^~rand_num[15];
				rand_num[14]<= rand_num[13]^~rand_num[15];
				rand_num[15]<= rand_num[14];
        end
            
end
endmodule
