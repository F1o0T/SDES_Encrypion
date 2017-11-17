while(true)
  p = input('Enter p value (Must be a prime value): ');
  i = 2;
  count = 0;
  while i < p
    if eq (mod(p,i), 0)
      count = count +1;
    end
  i = i +1 ;
  end  
  if count > 0
    disp('p Not Prime')
    continue;
  else
    break;
  end
end
while(true)
  q = input('Enter q value (Must be a prime value): ');
  i = 2;
  count = 0;
  while i < q
    if eq (mod(q,i), 0)
      count = count +1
    end
  i = i +1 ;
  end  
  if count > 0
    disp('q Not Prime')
    continue;
  else
    break;
  end
end
disp('Calculating n ...')
n = p * q 
disp('Calculating phi(n) ..')
phi = (p-1) *(q-1)
disp('Calculating Possible e Values  ... ')
count = 0;
e = [];
for i = 2:phi
  if mod(phi,i) ~= 0
    for j = 2:i-1
      if mod(i,j) ==0
        count = count + 1;
      end
    end
    if count == 0
      e = [e i];
    end  
  end
  i = i+1;
  count = 0;
end
e
count = 0;
while(true)
  disp('Choose one of e values above.');
  selected_e = input('Your Selection Is : ');
  disp('Checking your Selection . . . . . .');
  for i = 1 : length(e)
     if e(i) ~= selected_e   
      count = count +1;
     end
  end
  count
  if count == length(e)
    disp('')
    disp('Bad Entry - Sorry, But u need to visit Optometrist')
    disp('')
    count =0;
    continue;
  else 
    disp('')
    disp('Greet - Correct - But why are u sad today - Do not worry u will need it tomorrow.') 
    disp('')
    break;
  end
end
disp('Calculating Corresponding d to your e value')
j = 1;
for i = 0 : phi-1
 if mod(i*selected_e,phi) == 1
   d = i;
   d
 end
 j = j + 1;
end
disp('Now, it is the time to give your Plain_Text')
while(true)
  disp('================================')
  disp('1 - Character Encryption.')
  disp('2 - Numeral Encryption')
  disp('================================')
  input_type = input('Your Selection IS : ');
  if (input_type == 1)
    character_plain_text = "";
    while(true)
      entry = input('Enter your Character plain text, to end this process type (space) : ', 's');
      if entry == ' '
        break;
      end
      character_plain_text = [character_plain_text entry];
    end
  else  
    numeral_plain_text = [];
    while(true)
      entry = input('Enter your numeral plain text, to end this process type (0) : ');
      if entry == 0
        break;
      end
      numeral_plain_text = [numeral_plain_text entry];
    end
  end
  disp('================================')
  disp('Continue Giving your Data ?')
  disp('1 - Yes')
  disp('2 - No')
  decision = input('Type Your Decision : ');
  if (decision == 1)
    continue;
  elseif ('decision ==2')
    break;
  end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%digit_index = regexp(plain_text,'\d') 
%disp('');
%numbers = str2double(plain_text(digit_index))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%fprintf('Generting Cipher Text') 
%for i = 1 : 10 
%  fprintf(' .')
%  pause(1)
%end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  disp('================================')
  disp('Now Encrypting the Numeral Values')
  numeral_cipher_text = [];
  for i = numeral_plain_text
    temp = vpi(i)^selected_e;
    temp = mod(temp,n);
    numeral_cipher_text = [numeral_cipher_text temp];
  end
  numeral_cipher_text
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  disp('================================')
  disp('Converting Back to Plain_Text');
  numerals_back_to_plain_text = [];
  numeral_cipher_text = double(numeral_cipher_text);
  for j = numeral_cipher_text 
    temp = vpi(j)^d;
    temp = mod(temp,n);
    numerals_back_to_plain_text = [numerals_back_to_plain_text temp];
  end
  numerals_back_to_plain_text
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alphabets = ['a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z'];
alphabets_mapped_to_numerals = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26];
character_plain_text_mapped_to_numerals = [];
character_plain_text_size = length(character_plain_text);
for j = 1:character_plain_text_size
  for i = 1:26
    if(alphabets(i) == character_plain_text(j))
      character_plain_text_mapped_to_numerals(j) = alphabets_mapped_to_numerals(i);
    end
  end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  disp('================================')
  disp('Now Encrypting the character Values')
  character_cipher_text = [];
  for i = character_plain_text_mapped_to_numerals
    temp = vpi(i)^selected_e;
    temp = mod(temp,n);
    character_cipher_text = [character_cipher_text temp];
  end
  character_cipher_text
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  disp('================================')
  disp('Converting Back to Plain_Text');
  character_back_to_plain_text_as_numerals = [];
  character_cipher_text = double(character_cipher_text);
  for j = character_cipher_text 
    temp = vpi(j)^d;
    temp = mod(temp,n);
    character_back_to_plain_text_as_numerals = [character_back_to_plain_text_as_numerals temp];
  end
  character_back_to_plain_text_as_numerals_size = length(character_back_to_plain_text_as_numerals);
  character_back_to_plain_text_as_characters = "";
  for j = 1:character_back_to_plain_text_as_numerals_size
    for i = 1:26
      if(character_back_to_plain_text_as_numerals(j) == alphabets_mapped_to_numerals(i))
         character_back_to_plain_text_as_characters = [character_back_to_plain_text_as_characters alphabets(i)];
      end
    end  
  end
  character_back_to_plain_text_as_characters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%