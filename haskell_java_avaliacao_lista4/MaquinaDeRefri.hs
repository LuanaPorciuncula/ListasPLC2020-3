module MaquinaDeRefri where
import Control.Concurrent
import Control.Concurrent.MVar

--pCola gPoloNorte gQuate
--P-Cola, Guaraná Polo Norte e Guaraná Quate.

drink :: MVar Int -> Int -> String -> MVar Int -> MVar Bool -> IO ()
drink idCliente qtdCliente idRefri refri disp
  = do usando <- takeMVar disp
       newCliente <- takeMVar idCliente
       if (newCliente <= qtdCliente)
         then do newRefri <- (takeMVar refri)
                 -- 1000ms == 1000000 microseconds
                 threadDelay 1000000
                 --print(idRefri++" "++show (newRefri-300))
                 putMVar refri (newRefri - 300)
                 print ("O cliente "++(show newCliente)++" do refrigerante "++idRefri++" esta enchendo seu copo")
                 putMVar disp usando
                 putMVar idCliente (newCliente+1)
                 drink idCliente qtdCliente idRefri refri disp
         else do putMVar disp usando
                 putMVar idCliente newCliente

checkNRefill :: String -> MVar Int -> MVar Bool -> IO ()
checkNRefill idRefri refri disp
  = do usando <- takeMVar disp
       newRefri <- (takeMVar refri)
       if (newRefri < 1000)
         -- 1500ms == 1500000 microseconds
         then do threadDelay 1500000
                 putMVar refri (newRefri + 1000)
                 newRefri <- (takeMVar refri)
                 print ("O refrigerante "++idRefri++" foi reabastecido com 1000 ml, e agora possui "++show (newRefri)++" ml")
                 putMVar refri newRefri
         else do putMVar refri newRefri
       putMVar disp usando
       checkNRefill idRefri refri disp

main :: IO ()
main 
  = do pCola      <- newMVar 2000
       gPoloNorte <- newMVar 2000
       gQuate     <- newMVar 2000
       
       idCliente <- newMVar 1

       --Quantidade de clientes
       let qtdCliente = 30

       disp <- newMVar True

       forkIO (drink idCliente qtdCliente "pCola" pCola disp)
       forkIO (checkNRefill "pCola" pCola disp)
       
       forkIO (drink idCliente qtdCliente "Guarana Polo Norte" gPoloNorte disp)
       forkIO (checkNRefill "Guarana Polo Norte" gPoloNorte disp)

       forkIO (drink idCliente qtdCliente "Guarana Quate" gQuate disp)
       forkIO (checkNRefill "Guarana Quate" gQuate disp)
       
       --Tempo em microsegundos que a maquina ira funcionar
       threadDelay 50000000
       return ()
          
          