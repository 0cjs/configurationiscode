{-# LANGUAGE OverloadedStrings #-}
import           Hakyll
import           System.FilePath (joinPath, splitPath)

--------------------------------------------------------------------------------

main :: IO ()
main = hakyll $ do

    -- All our "just serve these files" content.
    match "docroot/**" $ do
        route   dropInitialComponent
        compile copyFileCompiler

--------------------------------------------------------------------------------
-- Custom code for our site

-- | Drop the given number of leading path components
dropInitialComponents :: Int -> Routes
dropInitialComponents n = customRoute $
    joinPath . drop n . splitPath . toFilePath

dropInitialComponent = dropInitialComponents 1
