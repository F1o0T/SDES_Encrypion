 %%%%%%%%%%%%%%%%%%%%%%%%%%%%given Inputs%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
key        = [ 1 0 0 0 1 0 0 0 1 0 ]
plain_text = [ 1 1 1 0 1 1 1 0     ]
%%%%%%%%%%%%%%%%%%%%%%%Key_1 and Key_2 generation%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
original_permutated10_key                                                     = [ key(3) key(5) key(2) key(7) key(4)  key(10) key(1) key(9) key(8) key(6) ] 
o_p_k                                                                         = original_permutated10_key;
original_permutated10_key_after_first_rotation                                = [ o_p_k(2) o_p_k(3) o_p_k(4) o_p_k(5) o_p_k(1) o_p_k(7) o_p_k(8) o_p_k(9) o_p_k(10) o_p_k(6) ]
o_p_k_a_f_r                                                                   = original_permutated10_key_after_first_rotation;
original_permuted8_key_after_permutation10_and_first_rotation                 = [ o_p_k_a_f_r(6) o_p_k_a_f_r(3) o_p_k_a_f_r(7) o_p_k_a_f_r(4) o_p_k_a_f_r(8) o_p_k_a_f_r(5) o_p_k_a_f_r(10) o_p_k_a_f_r(9) ];
first_key                                                                     = original_permuted8_key_after_permutation10_and_first_rotation
original_permutated10_key_after_first_and_second_rotation                     = [ o_p_k_a_f_r(3) o_p_k_a_f_r(4) o_p_k_a_f_r(5) o_p_k_a_f_r(1)  o_p_k_a_f_r(2) o_p_k_a_f_r(8) o_p_k_a_f_r(9) o_p_k_a_f_r(10) o_p_k_a_f_r(6) o_p_k_a_f_r(7) ]
o_p10_k_a_f_a_s_r                                                             = original_permutated10_key_after_first_and_second_rotation;
original_permuted8_key_after_permutation10_and_first_and_second_rotation      = [ o_p10_k_a_f_a_s_r(6) o_p10_k_a_f_a_s_r(3) o_p10_k_a_f_a_s_r(7) o_p10_k_a_f_a_s_r(4) o_p10_k_a_f_a_s_r(8) o_p10_k_a_f_a_s_r(5) o_p10_k_a_f_a_s_r(10) o_p10_k_a_f_a_s_r(9) ];
second_key                                                                    = original_permuted8_key_after_permutation10_and_first_and_second_rotation
%%%%%%%%%%%%%%%%%%%%%%%End of Keys Generation%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%Working on the Plain_text%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p_t = plain_text;
plain_text_initial_permutation                                                = [ p_t(2) p_t(6) p_t(3) p_t(1) p_t(4) p_t(8) p_t(5) p_t(7) ]
p_t_i_p                                                                       = plain_text_initial_permutation;
left_half_of_initilally_permutated_plain_text                                 = [ p_t_i_p(1) p_t_i_p(2) p_t_i_p(3) p_t_i_p(4) ]
l_h_o_i_p_p_t                                                                 = left_half_of_initilally_permutated_plain_text
right_half_of_initilally_permutated_plain_text                                = [ p_t_i_p(5) p_t_i_p(6) p_t_i_p(7) p_t_i_p(8) ]
r_h_o_i_p_p_t                                                                 = right_half_of_initilally_permutated_plain_text;
expansion_of_right_half_of_initilally_permutated_plain_text                   = [ r_h_o_i_p_p_t(4) r_h_o_i_p_p_t(1) r_h_o_i_p_p_t(2) r_h_o_i_p_p_t(3) r_h_o_i_p_p_t(2) r_h_o_i_p_p_t(3) r_h_o_i_p_p_t(4) r_h_o_i_p_p_t(1) ]
e_o_r_h_o_i_p_p_t                                                             = expansion_of_right_half_of_initilally_permutated_plain_text;
xored_key1_with_the_expanded_right_half_of_initilally_permutated_plain_text   = xor(first_key,e_o_r_h_o_i_p_p_t)
xored_k1_w_t_e_r_h_o_i_p_p_t                                                  = xored_key1_with_the_expanded_right_half_of_initilally_permutated_plain_text;
row_of_the_leftmost_half                                                      = xored_k1_w_t_e_r_h_o_i_p_p_t(4)+ xored_k1_w_t_e_r_h_o_i_p_p_t(1) *2
column_of_the_leftmost_half                                                   = xored_k1_w_t_e_r_h_o_i_p_p_t(3)+ xored_k1_w_t_e_r_h_o_i_p_p_t(2) *2
s0                                                                            = [ 1 0 3 2 ; 3 2 1 0 ; 0 2 1 3 ; 3 1 3 2 ]
the_left_most_value_of_sbox                                                   = s0(row_of_the_leftmost_half + 1 , column_of_the_leftmost_half + 1)
row_of_the_rightmost_half                                                     = xored_k1_w_t_e_r_h_o_i_p_p_t(8)+ xored_k1_w_t_e_r_h_o_i_p_p_t(5) *2
column_of_the_rightmost_half                                                  = xored_k1_w_t_e_r_h_o_i_p_p_t(7)+ xored_k1_w_t_e_r_h_o_i_p_p_t(6) *2
s1                                                                            = [ 0 1 2 3 ; 2 0 1 3 ; 3 0 1 0 ; 2 1 0 3 ]  
the_right_most_value_of_sbox                                                  = s1(row_of_the_rightmost_half + 1 , column_of_the_rightmost_half + 1)
sbox_output_of_our_last_xor_operation_output                                  = [ floor(the_left_most_value_of_sbox/2) rem(the_left_most_value_of_sbox,2) floor(the_right_most_value_of_sbox/2) rem(the_right_most_value_of_sbox,2) ]
sbox_o_o_o_l_x_o_o                                                            = sbox_output_of_our_last_xor_operation_output;
sbox_output_permuted4                                                         = [ sbox_o_o_o_l_x_o_o(2) sbox_o_o_o_l_x_o_o(4) sbox_o_o_o_l_x_o_o(3) sbox_o_o_o_l_x_o_o(1) ]
F_of_R_and_k1                                                                 = sbox_output_permuted4        
left_of_fk1                                                                   = xor(F_of_R_and_k1 , l_h_o_i_p_p_t)                            
the_totoal_fk1                                                                = [ left_of_fk1 right_half_of_initilally_permutated_plain_text ]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
swapped_r_and_l_of_fk1                                                        = [ right_half_of_initilally_permutated_plain_text left_of_fk1 ]
the_rightmost_of_input_to_fk2                                                 = [ left_of_fk1 ]
t_rm_o_i_t_fk2                                                                = the_rightmost_of_input_to_fk2;
the_leftmost_of_input_to_fk2                                                  = right_half_of_initilally_permutated_plain_text
t_lm_o_i_t_fk2                                                                = the_leftmost_of_input_to_fk2;
expansion_of_right_half_of_input_to_fk2                                       = [ t_rm_o_i_t_fk2(4) t_rm_o_i_t_fk2(1) t_rm_o_i_t_fk2(2) t_rm_o_i_t_fk2(3) t_rm_o_i_t_fk2(2) t_rm_o_i_t_fk2(3) t_rm_o_i_t_fk2(4) t_rm_o_i_t_fk2(1) ]
e_o_r_h_o_i_t_fk2                                                             = expansion_of_right_half_of_input_to_fk2;
xored_key2_with_the_expanded_right_half_of_input_to_fk2                       = xor(second_key , e_o_r_h_o_i_t_fk2)
xored_k2_w_t_e_r_h_o_i_t_fk2                                                  = xored_key2_with_the_expanded_right_half_of_input_to_fk2;
row_of_the_leftmost_half                                                      = xored_k2_w_t_e_r_h_o_i_t_fk2 (4)+ xored_k2_w_t_e_r_h_o_i_t_fk2 (1) *2
column_of_the_leftmost_half                                                   = xored_k2_w_t_e_r_h_o_i_t_fk2 (3)+ xored_k2_w_t_e_r_h_o_i_t_fk2 (2) *2
the_left_most_value_of_sbox                                                   = s0(row_of_the_leftmost_half + 1 , column_of_the_leftmost_half + 1)
row_of_the_rightmost_half                                                     = xored_k2_w_t_e_r_h_o_i_t_fk2 (8)+ xored_k2_w_t_e_r_h_o_i_t_fk2 (5) *2
column_of_the_rightmost_half                                                  = xored_k2_w_t_e_r_h_o_i_t_fk2 (7)+ xored_k2_w_t_e_r_h_o_i_t_fk2 (6) *2
the_right_most_value_of_sbox                                                  = s1(row_of_the_rightmost_half + 1 , column_of_the_rightmost_half + 1)
sbox_output_of_our_last_xor_operation_output                                  = [ floor(the_left_most_value_of_sbox/2) rem(the_left_most_value_of_sbox,2) floor(the_right_most_value_of_sbox/2) rem(the_right_most_value_of_sbox,2) ]
sbox_o_o_o_l_x_o_o                                                            = sbox_output_of_our_last_xor_operation_output;
sbox_output_permuted4                                                         = [ sbox_o_o_o_l_x_o_o(2) sbox_o_o_o_l_x_o_o(4) sbox_o_o_o_l_x_o_o(3) sbox_o_o_o_l_x_o_o(1) ]
F_of_R_and_k2                                                                 = sbox_output_permuted4        
left_of_fk2                                                                   = xor(F_of_R_and_k2 , t_lm_o_i_t_fk2)                            
the_totoal_fk2                                                                = [ left_of_fk2 the_rightmost_of_input_to_fk2 ]
inverse_initial_permutation_of_fk2_output                                     = [ the_totoal_fk2(4) the_totoal_fk2(1) the_totoal_fk2(3) the_totoal_fk2(5) the_totoal_fk2(7) the_totoal_fk2(2) the_totoal_fk2(8) the_totoal_fk2(6) ]; 
the_cipher_text_is                                                            = inverse_initial_permutation_of_fk2_output
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%










